module Google
  module Idtoken
    module Verifier
      module CLI
        module Commands
          # Command to check an ID token
          class Check < Base
            # Prepare a verification run from the terminal
            # @param id_token [String]
            def initialize(id_token)
              @id_token = id_token
            end

            # Prints the verification result of an ID token
            def run
              result = Verifier.verify(@id_token)
              if result.valid?
                print_valid
              else
                print_invalid
              end
              out.print "Data:"
              out.pretty result.data
            end

            private

            def print_valid
              out.print "Valid ID token!"
              out.print
            end

            def print_invalid
              out.print "INVALID ID token!"
              out.print
            end
          end
        end
      end
    end
  end
end
