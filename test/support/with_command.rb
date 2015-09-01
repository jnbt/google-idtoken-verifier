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
      lines << text
    end

    def pretty(object)
      lines << object
    end
  end
end
