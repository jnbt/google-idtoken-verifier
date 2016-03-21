require "test_helper"

class CLICommandsCheckTest < Minitest::Test
  include Google::Idtoken::Verifier::CLI
  include WithCommand

  def test_calls_verify
    stub = proc do |token|
      Google::Idtoken::Verifier::Result.new(token: token)
    end
    Google::Idtoken::Verifier.stub :verify, stub do
      run_command!
    end
    assert_out "INVALID ID token!", "", "Data:", "{:token=>\"an_id_token\"}"
  end

  private

  def arguments
    ["an_id_token"]
  end

  def subject
    @subject ||= Commands::Check
  end
end
