# typed: strong

module Scalar
  module Resources
    # Namespaces
    class Namespaces
      # Get all namespaces for the current team
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(String)
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
