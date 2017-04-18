# frozen_string_literal: true

module Google
  module Idtoken
    module Verifier
      module CLI
        module Commands
          # Command to show the gem's version
          class Version < Base
            # Prints the current gem's version to the command line
            def run
              out.print Verifier::VERSION
            end
          end
        end
      end
    end
  end
end
