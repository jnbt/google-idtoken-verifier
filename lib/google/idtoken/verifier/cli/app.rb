# frozen_string_literal: true

require "optparse"

module Google
  module Idtoken
    module Verifier
      module CLI
        # Main class for the executable 'google_idtoken_verifier'
        # @example
        #   $ google_idtoken_verifier -h
        class App
          def self.start
            App.new(ARGV).run
          end

          # Arguments the application was called with
          attr_reader :args
          # Output buffer
          attr_reader :out

          def initialize(args, out = Out.new)
            @args = args
            @out  = out
          end

          def run
            if args.empty?
              out.print opt_parser
            else
              opt_parser.parse!(args)
            end
          end

          def check(id_token)
            Commands::Check.run(id_token)
          end

          def version
            Commands::Version.run
          end

          private

          def opt_parser
            OptionParser.new do |opts|
              opts.banner = "Usage: google_idtoken_verifier [options]"

              opts.separator ""
              opts.separator "Options:"

              opts.on("-c", "--verify ID_TOKEN",
                      "Verify an Google Signin ID token") do |token|
                check(token)
              end

              opts.on_tail("-h", "--help", "Show this message") do
                out.print opts
              end

              opts.on_tail("-v", "--version", "Show version") do
                version
              end
            end
          end
        end
      end
    end
  end
end
