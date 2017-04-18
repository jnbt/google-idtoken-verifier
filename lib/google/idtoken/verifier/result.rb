# frozen_string_literal: true

module Google
  module Idtoken
    module Verifier
      # Wraps the API response
      class Result
        # Parsed API response
        attr_reader :data

        # Wraps a parsed API response
        # @param data [Hash] from Google's API
        def initialize(data)
          @data = data
        end

        # Checks if the API recognized the ID token as valid
        # @return [Boolean]
        def valid?
          data && !data["sub"].nil?
        end
      end
    end
  end
end
