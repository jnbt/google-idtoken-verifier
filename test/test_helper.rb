# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "coveralls"
Coveralls.wear!

require "google/idtoken/verifier"
require "google/idtoken/verifier/cli"

require "minitest/autorun"

require "webmock/minitest"

require_relative "support/with_fixtures"
require_relative "support/with_command"
