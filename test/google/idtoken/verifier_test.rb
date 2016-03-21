require "test_helper"
require "ostruct"

class VerifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Google::Idtoken::Verifier::VERSION
  end

  def test_verify_uses_api_client
    stub = -> (x) { OpenStruct.new(call: { "sub" => x }) }
    ::Google::Idtoken::Verifier::Client.stub :new, stub do
      result = ::Google::Idtoken::Verifier.verify("a_token")
      assert_instance_of ::Google::Idtoken::Verifier::Result, result
      assert_equal "a_token", result.data["sub"]
    end
  end
end
