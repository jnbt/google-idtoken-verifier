require "test_helper"

class CLIAppTest < Minitest::Test
  include Google::Idtoken::Verifier::CLI

  def test_supports_the_version_command
    stub_command(Commands::Version) do
      assert_equal :stubbed, subject.version
      assert @arguments.empty?, "should have no arguments"
    end
  end

  def test_supports_the_check_command
    stub_command(Commands::Check) do
      assert_equal :stubbed, subject.check("id_token")
      assert_equal ["id_token"], @arguments
    end
  end

  private

  def subject
    @subject ||= App.new([])
  end

  def stub_command(target)
    stub = proc do |*args|
      @arguments = args
      :stubbed
    end
    target.stub :run, stub do
      yield
    end
  end
end
