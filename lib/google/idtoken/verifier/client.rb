require "json"

module Google
  module Idtoken
    module Verifier
      # API client for requesting the state of an ID token
      class Client
        # Global REST endpoint to use
        ENDPOINT = "https://www.googleapis.com/oauth2/" \
                   "v3/tokeninfo?id_token=%s".freeze

        # ID token to verify
        attr_reader :id_token

        # Initializes a new client bound to an ID token
        # @param id_token [String] to verify
        def initialize(id_token)
          @id_token = id_token
        end

        # Interacts with the Google API
        # @return [Hash] the parsed JSON response
        # @raise [Error] if any error occures
        def call
          JSON.parse(verify_call)
        rescue StandardError => e
          raise Error, e.message
        end

        private

        def verify_call
          Net::HTTP.get(api_endpoint_uri)
        end

        def api_endpoint_uri
          URI(ENDPOINT % id_token)
        end
      end
    end
  end
end
