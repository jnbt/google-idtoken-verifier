$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "coveralls"
Coveralls.wear!

require "google/idtoken/verifier"

require "minitest/autorun"

require "webmock/minitest"

require_relative "support/with_fixtures"
