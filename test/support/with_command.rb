# frozen_string_literal: true

module WithCommand
  def out
    @out ||= OutRecorder.new
  end

  def run_command!
    Google::Idtoken::Verifier::CLI::Out.stub :new, out do
      subject.run(*arguments)
    end
  end

  def arguments
    []
  end

  def assert_out(*expected)
    assert_equal expected, out.lines
  end

  class OutRecorder
    def lines
      @lines ||= []
    end

    def print(text = "")
      lines << text.to_s
    end

    def pretty(object)
      lines << object.to_s
    end
  end
end
