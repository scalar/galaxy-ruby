# typed: strong

module ScalarGalaxy
  module Internal
    module Transport
      # @api private
      class ConnectionPool
        # @api private
        sig do
          params(
            timeout: Float,
            blk: T.proc.params(arg0: Net::HTTP).returns(T.anything)
          ).returns(T.anything)
        end
        def with(timeout:, &blk)
        end

        # @api private
        sig { params(timeout: Float).returns([Net::HTTP, Integer]) }
        private def checkout(timeout)
        end

        # @api private
        sig { params(conn: Net::HTTP, pid: Integer).void }
        private def checkin(conn, pid)
        end

        # @api private
        #
        # Closes every idle connection, and every checked-out one as it comes back.
        sig { params(close: T.proc.params(arg0: Net::HTTP).void).void }
        def shutdown(&close)
        end

        # @api private
        sig { void }
        private def reset_after_fork
        end

        # @api private
        sig do
          params(size: Integer, blk: T.proc.returns(Net::HTTP)).returns(
            T.attached_class
          )
        end
        def self.new(size:, &blk)
        end
      end
    end
  end
end
