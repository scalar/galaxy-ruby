# frozen_string_literal: true

module ScalarGalaxy
  module Internal
    module Transport
      # @api private
      #
      # A fixed-size, thread-safe pool of lazily created connections. `PooledNetRequester` keeps one per
      # origin, so `size` caps the concurrent requests to that origin.
      class ConnectionPool
        # @api private
        #
        # Checks a connection out for the duration of the block and back in afterwards, even when the
        # block raises.
        #
        # @param timeout [Float] seconds to wait for a connection when every one is checked out
        # @param blk [Proc]
        #
        # @raise [Timeout::Error] when no connection frees up within `timeout`
        # @yieldparam [Object]
        # @return [Object] the block's result
        def with(timeout:, &blk)
          # Interrupts (`Thread#raise`, `Timeout.timeout`) are held back while a connection changes
          # hands, so none can land between the checkout and the `ensure` and leak the connection. The
          # block itself runs with them enabled again.
          ::Thread.handle_interrupt(Object => :never) do
            conn, pid = checkout(timeout)
            begin
              ::Thread.handle_interrupt(Object => :immediate) { blk.call(conn) }
            ensure
              checkin(conn, pid)
            end
          end
        end

        # @api private
        #
        # @param timeout [Float]
        #
        # @raise [Timeout::Error]
        # @return [Array(Object, Integer)] the connection, and the process it was checked out in
        private def checkout(timeout)
          # The deadline is on the monotonic clock, as the requester's own is, so a wall-clock jump can
          # neither stretch nor cut the wait.
          deadline = ScalarGalaxy::Internal::Util.monotonic_secs + timeout
          @mutex.synchronize do
            reset_after_fork
            loop do
              # An idle connection or a free slot is handed out even once the deadline has passed: the
              # timeout bounds the wait for one, and the requester's socket timeouts take over from
              # there. Most recently returned first, so the connection most likely to still be alive
              # is the one reused.
              return @idle.pop, @pid unless @idle.empty?

              if @created < @size
                # Created under the lock so two threads cannot both take the last slot. That is cheap:
                # the block only builds the client object, and the requester connects it later.
                conn = @create.call
                @created += 1
                return conn, @pid
              end

              remaining = deadline - ScalarGalaxy::Internal::Util.monotonic_secs
              unless remaining.positive?
                raise Timeout::Error, "Waited #{timeout} seconds for one of #{@size} pooled connections"
              end

              # `wait` releases the mutex while it sleeps and takes it back before returning, whether a
              # check-in, the timeout or a spurious wakeup woke it. So the loop looks at the pool again
              # instead of trusting the reason, and only ever waits for what is left of the deadline.
              @available.wait(@mutex, remaining)
            end
          end
        end

        # @api private
        #
        # @param conn [Object]
        # @param pid [Integer]
        private def checkin(conn, pid)
          close = nil
          @mutex.synchronize do
            reset_after_fork
            # A connection checked out before a fork is the parent's: `reset_after_fork` has already
            # stopped counting it, so it is dropped rather than handed to the child's next request.
            if pid == @pid && @close
              close = @close
              # Its slot is free again, so the next checkout can build a connection in its place.
              @created -= 1
            elsif pid == @pid
              @idle.push(conn)
            end
            @available.signal
          end
          # A pool shut down while this connection was out keeps nothing; closed outside the lock.
          begin
            close&.call(conn)
          rescue StandardError
            nil
          end
        end

        # @api private
        #
        # Closes every idle connection with `close` and every connection still checked out as it comes
        # back, so a pool the owner has let go of holds no socket open. The pool still works after
        # this, one connection per checkout, for a caller that looked it up just before.
        #
        # @param close [Proc] closes one connection
        #
        # @yieldparam [Object]
        def shutdown(&close)
          idle =
            @mutex.synchronize do
              @close = close
              # A forked child does not own the parent's connections, so it closes none of them.
              taken = @pid == Process.pid ? @idle.slice!(0..) : []
              @created -= taken.size
              taken
            end
          idle.each do |conn|
            close.call(conn)
          rescue StandardError
            nil
          end
        end

        # @api private
        #
        # A forked child inherits the parent's open sockets. Reusing one would interleave both
        # processes' requests on a single connection, so the first checkout or check-in in a new
        # process forgets every connection and lets the pool fill up again from empty. The forgotten
        # ones are not closed either: closing a TLS connection writes to the socket the parent is still
        # using.
        private def reset_after_fork
          return if @pid == Process.pid

          @idle.clear
          @created = 0
          @pid = Process.pid
        end

        # @api private
        #
        # @param size [Integer]
        # @param blk [Proc] builds one connection, called lazily as the pool fills up
        def initialize(size:, &blk)
          @size = size
          @create = blk
          @mutex = Mutex.new
          @available = ConditionVariable.new
          @idle = []
          @created = 0
          @pid = Process.pid
          @close = nil
        end
      end
    end
  end
end
