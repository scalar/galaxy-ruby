# typed: strong

module ScalarGalaxy
  module Internal
    module Type
      # @api private
      module RequestParameters
        # Options to specify HTTP behaviour for this request.
        sig { returns(ScalarGalaxy::RequestOptions) }
        attr_reader :request_options

        sig do
          params(request_options: ScalarGalaxy::RequestOptions::OrHash).void
        end
        attr_writer :request_options

        # @api private
        module Converter
          # @api private
          sig do
            params(params: T.anything).returns(
              [T.anything, ScalarGalaxy::Internal::AnyHash]
            )
          end
          def dump_request(params)
          end
        end
      end
    end
  end
end
