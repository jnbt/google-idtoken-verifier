# frozen_string_literal: true

require "google/idtoken/verifier/client"
require "google/idtoken/verifier/error"
require "google/idtoken/verifier/result"
require "google/idtoken/verifier/version"

module Google
  module Idtoken
    # Ruby interface to Google's API to verify ID tokens
    # @usage
    #
    #   result = Verifier.verify("an_id_token")
    #   if result.valid?
    #     puts "ID: #{result.data["sub"]}"
    #     puts "Audience: #{result.data["aud"]}"
    #     # here you should check the 'aud' value against your apps
    #   else
    #    puts "Invalid ID token"
    #   end
    #
    module Verifier
      # Checks an ID token
      # @param id_token [String] ID token to verify
      # @return [Result] API result
      def self.verify(id_token)
        response = Client.new(id_token).call
        Result.new(response)
      end
    end
  end
end
