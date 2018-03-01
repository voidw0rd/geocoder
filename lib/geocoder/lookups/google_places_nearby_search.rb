require "geocoder/lookups/google"
require "geocoder/results/google_places_nearby_search"

module Geocoder
  module Lookup
    class GooglePlacesNearbySearch < Google
      def name
        "Google Places Nearby Search"
      end

      def required_api_key_parts
        ["key"]
      end

      def supported_protocols
        [:https]
      end

      def query_url(query)
        "#{protocol}://maps.googleapis.com/maps/api/place/nearbysearch/json?#{url_query_string(query)}"
      end

      private

      def query_url_google_params(query)
        {
          query: query.text,
          language: query.language || configuration.language
        }
      end
    end
  end
end
