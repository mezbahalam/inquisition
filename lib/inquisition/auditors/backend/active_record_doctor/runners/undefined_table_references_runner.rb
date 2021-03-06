module Inquisition
  module Auditors
    module Backend
      module ActiveRecordDoctor
        module Runners
          class UndefinedTableReferencesRunner < Auditors::Runner
            private

            def command
              'rake active_record_doctor:undefined_table_references'
            end

            def formatter
              Formatters::UndefinedTableReferencesFormatter
            end
          end
        end
      end
    end
  end
end
