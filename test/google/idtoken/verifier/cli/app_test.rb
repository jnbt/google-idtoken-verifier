require "test_helper"

class CLIAppTest < Minitest::Test
  include WithCommand
  include Google::Idtoken::Verifier::CLI

  def test_prints_help_as_option
    invoke("-h")
    assert_out_contains_usage
  end

  def test_prints_help_as_default
    invoke
    assert_out_contains_usage
  end

  def test_supports_the_version_command
    stub_command(Commands::Version) do
      invoke("-v")
      assert @arguments.empty?, "should have no arguments"
    end
  end

  def test_supports_the_check_command
    stub_command(Commands::Check) do
      invoke("-c", "id_token")
      assert_equal ["id_token"], @arguments
    end
  end

  private

  def assert_out_contains_usage
    assert_match(/Usage/, out.lines.join("\n"))
  end

  def invoke(*args)
    App.new(args, out).run
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
