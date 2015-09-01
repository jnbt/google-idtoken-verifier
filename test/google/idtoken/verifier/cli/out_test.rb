require "test_helper"

class CLIOutTest < Minitest::Test
  include Google::Idtoken::Verifier::CLI

  def test_defaults_to_use_stdout
    assert_same $stdout, Out.new.out
  end

  def test_holds_the_outlet
    assert_same out, subject.out
  end

  def test_prints_to_outlet
    subject.print "some text"
    subject.print "another line"
    close
    expected = [
      "some text\n",
      "another line\n"
    ]
    assert_equal expected, out.readlines
  end

  def test_pretty_prints_to_outlet
    subject.pretty dummy: 1
    subject.pretty [1, 2, 3]
    close
    expected = [
      "{:dummy=>1}\n",
      "[1, 2, 3]\n"
    ]
    assert_equal expected, out.readlines
  end

  private

  def subject
    @subject ||= Out.new(out)
  end

  def out
    @out ||= StringIO.new
  end

  def close
    out.flush
    out.rewind
  end
end
