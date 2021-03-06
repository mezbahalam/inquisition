module Inquisition
  module Auditors
    module Backend
      module LolDba
        class Installer < Auditors::Installer
          class << self
            private

            def checkers
              [
                Core::Checkers::RubyVersionChecker.new(from_version: '2.1.1')
              ]
            end
          end
        end
      end
    end
  end
end
