require "test_helper"

class VerifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Google::Idtoken::Verifier::VERSION
  end
end
