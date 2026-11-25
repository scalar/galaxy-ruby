# typed: strong

module ScalarGalaxy
  module Internal
    module Transport
      # @api private
      class PooledNetRequester
        extend ScalarGalaxy::Internal::Util::SorbetRuntimeSupport

        Request =
          T.type_alias do
            {
              method: Symbol,
              url: URI::Generic,
              headers: T::Hash[String, String],
              body: T.anything,
              deadline: Float,
              error_url: T.nilable(URI::Generic)
            }
          end

        # from the golang stdlib
        # https://github.com/golang/go/blob/c8eced8580028328fde7c03cbfcb720ce15b2358/src/net/http/transport.go#L49
        KEEP_ALIVE_TIMEOUT = 30

        DEFAULT_MAX_CONNECTIONS = T.let(T.unsafe(nil), Integer)

        # Most origins the requester keeps a connection pool for at once.
        MAX_POOLS = 16

        # Seconds each socket wait gets once the deadline has passed between two body chunks.
        ELAPSED_SOCKET_TIMEOUT = T.let(0.001, Float)

        # @api private
        sig { returns(OpenSSL::X509::Store) }
        attr_reader :cert_store

        class << self
          # @api private
          sig { params(cert_store: OpenSSL::X509::Store, url: URI::Generic).returns(Net::HTTP) }
          def connect(cert_store:, url:)
          end

          # @api private
          sig { params(conn: Net::HTTP, deadline: Float, finishing: T::Boolean).void }
          def calibrate_socket_timeout(conn, deadline, finishing: false)
          end

          # @api private
          sig do
            params(
              request: ScalarGalaxy::Internal::Transport::PooledNetRequester::Request,
              blk: T.proc.params(arg0: String).void
            ).returns([Net::HTTPGenericRequest, T.proc.void])
          end
          def build_request(request, &blk)
          end
        end

        # @api private
        sig { params(url: URI::Generic, deadline: Float, blk: T.proc.params(arg0: Net::HTTP).void).void }
        private def with_pool(url, deadline:, &blk)
        end

        # @api private
        sig do
          params(
            request: ScalarGalaxy::Internal::Transport::PooledNetRequester::Request
          ).returns([Integer, Net::HTTPResponse, T::Enumerable[String]])
        end
        def execute(request)
        end

        # @api private
        sig { params(size: Integer).returns(T.attached_class) }
        def self.new(
          size: ScalarGalaxy::Internal::Transport::PooledNetRequester::DEFAULT_MAX_CONNECTIONS
        )
        end
      end
    end
  end
end
