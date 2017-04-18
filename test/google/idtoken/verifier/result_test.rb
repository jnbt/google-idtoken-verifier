# frozen_string_literal: true

require "test_helper"

class ResultTest < Minitest::Test
  include ::Google::Idtoken::Verifier

  def test_result_with_sub_is_valid
    result = Result.new("sub" => "12345")
    assert result.valid?, "result must be valid"
  end

  def test_result_without_sub_is_invalid
    result = Result.new("error_description" => "some_error")
    refute result.valid?, "result must be valid"
  end
end
