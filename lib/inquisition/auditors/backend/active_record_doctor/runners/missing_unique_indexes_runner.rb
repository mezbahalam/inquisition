module Inquisition
  module Auditors
    module Backend
      module ActiveRecordDoctor
        module Runners
          class MissingUniqueIndexesRunner < Auditors::Runner
            private

            def command
              'rake active_record_doctor:missing_unique_indexes'
            end

            def formatter
              Formatters::MissingUniqueIndexesFormatter
            end
          end
        end
      end
    end
  end
end
