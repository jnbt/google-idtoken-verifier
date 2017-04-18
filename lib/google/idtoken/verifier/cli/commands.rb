# frozen_string_literal: true

module Google
  module Idtoken
    module Verifier
      module CLI
        # Module for actual commands which can be invoked from the terminal
        module Commands
          # Base for all commands providing simple support for running a single
          # command and printing to an {Out} instance
          class Base
            # Run a single instance of a command
            # @param args [Array] arguments for the command
            # @return [Base] the command after the run
            def self.run(*args)
              new(*args).tap(&:run)
            end

            protected

            def out
              @out ||= Out.new
            end
          end
        end
      end
    end
  end
end

require "google/idtoken/verifier/cli/commands/check"
require "google/idtoken/verifier/cli/commands/version"
