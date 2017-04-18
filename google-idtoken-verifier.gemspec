# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google/idtoken/verifier/version"

Gem::Specification.new do |spec|
  spec.name          = "google-idtoken-verifier"
  spec.version       = Google::Idtoken::Verifier::VERSION
  spec.authors       = ["Jonas Thiel"]
  spec.email         = ["jt@neopoly.de"]

  spec.summary       = "Ruby interface to Google's API to verify ID tokens"
  spec.description   = "Ruby interface to Google's API to verify ID tokens"
  spec.homepage      = "https://github.com/jnbt/google-idtoken-verifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock", "~> 3.0"
  spec.add_development_dependency "inch", "~> 0.7"
  spec.add_development_dependency "rubocop", "~> 0.48"
end
