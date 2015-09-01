$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "google/idtoken/verifier"

require "minitest/autorun"

require "coveralls"
Coveralls.wear!

require "webmock/minitest"

require_relative "support/with_fixtures"
