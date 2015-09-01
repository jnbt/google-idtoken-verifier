require "test_helper"

class CLICommandsVersionTest < Minitest::Test
  include Google::Idtoken::Verifier::CLI
  include WithCommand

  def test_prints_the_gems_version
    run_command!
    assert_out Google::Idtoken::Verifier::VERSION
  end

  private

  def subject
    @subject ||= Commands::Version
  end
end
