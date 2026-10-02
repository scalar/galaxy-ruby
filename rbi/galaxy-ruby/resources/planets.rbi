# typed: strong

module ScalarGalaxy
  module Resources
    # Everything about planets
    class Planets
      # Time to play god and create a new planet. What do you think? Ah, don't think too
      # much. What could go wrong anyway?
      sig do
        params(
          id: Integer,
          name: String,
          atmosphere: T::Array[ScalarGalaxy::Planet::Atmosphere::OrHash],
          creator: ScalarGalaxy::User::OrHash,
          description: T.nilable(String),
          discovered_at: Time,
          failure_callback_url: String,
          habitability_index: Float,
          image: T.nilable(String),
          last_updated: Time,
          physical_properties: ScalarGalaxy::Planet::PhysicalProperties::OrHash,
          satellites: T::Array[T.anything],
          success_callback_url: String,
          tags: T::Array[String],
          type: ScalarGalaxy::Planet::Type::OrSymbol,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Planet)
      end
      def create(
        id:,
        name:,
        # Atmospheric composition
        atmosphere: nil,
        # A user
        creator: nil,
        description: nil,
        discovered_at: nil,
        # URL which gets invoked upon a failed operation
        failure_callback_url: nil,
        # A score from 0 to 1 indicating potential habitability
        habitability_index: nil,
        image: nil,
        last_updated: nil,
        physical_properties: nil,
        satellites: nil,
        # URL which gets invoked upon a successful operation
        success_callback_url: nil,
        tags: nil,
        type: nil,
        request_options: {}
      )
      end

      # You'll better learn a little bit more about the planets. It might come in handy
      # once space travel is available for everyone.
      sig do
        params(
          planet_id: Integer,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Planet)
      end
      def retrieve(
        # The ID of the planet to get
        planet_id,
        request_options: {}
      )
      end

      # Sometimes you make mistakes, that's fine. No worries, you can update all
      # planets.
      sig do
        params(
          planet_id: Integer,
          id: Integer,
          name: String,
          atmosphere: T::Array[ScalarGalaxy::Planet::Atmosphere::OrHash],
          creator: ScalarGalaxy::User::OrHash,
          description: T.nilable(String),
          discovered_at: Time,
          failure_callback_url: String,
          habitability_index: Float,
          image: T.nilable(String),
          last_updated: Time,
          physical_properties: ScalarGalaxy::Planet::PhysicalProperties::OrHash,
          satellites: T::Array[T.anything],
          success_callback_url: String,
          tags: T::Array[String],
          type: ScalarGalaxy::Planet::Type::OrSymbol,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Planet)
      end
      def update(
        # The ID of the planet to get
        planet_id,
        id:,
        name:,
        # Atmospheric composition
        atmosphere: nil,
        # A user
        creator: nil,
        description: nil,
        discovered_at: nil,
        # URL which gets invoked upon a failed operation
        failure_callback_url: nil,
        # A score from 0 to 1 indicating potential habitability
        habitability_index: nil,
        image: nil,
        last_updated: nil,
        physical_properties: nil,
        satellites: nil,
        # URL which gets invoked upon a successful operation
        success_callback_url: nil,
        tags: nil,
        type: nil,
        request_options: {}
      )
      end

      # This endpoint was used to delete planets. Unfortunately, that caused a lot of
      # trouble for planets with life. So, this endpoint is now deprecated and should
      # not be used anymore.
      sig do
        params(
          planet_id: Integer,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The ID of the planet to get
        planet_id,
        request_options: {}
      )
      end

      # Got a crazy good photo of a planet? Share it with the world!
      sig do
        params(
          planet_id: Integer,
          image: ScalarGalaxy::Internal::FileInput,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Models::PlanetDelteImageResponse)
      end
      def delte_image(
        # The ID of the planet to get
        planet_id,
        # The image file to upload
        image: nil,
        request_options: {}
      )
      end

      # It's easy to say you know them all, but do you really? Retrieve all the planets
      # and check whether you missed one.
      sig do
        params(
          limit: Integer,
          offset: Integer,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Models::PlanetListAllDataResponse)
      end
      def list_all_data(
        # The number of items to return
        limit: nil,
        # The number of items to skip before starting to collect the result set
        offset: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ScalarGalaxy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
