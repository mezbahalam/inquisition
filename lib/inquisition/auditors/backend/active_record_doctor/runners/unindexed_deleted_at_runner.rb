module Inquisition
  module Auditors
    module Backend
      module ActiveRecordDoctor
        module Runners
          class UnindexedDeletedAtRunner < Auditors::Runner
            private

            def command
              'rake active_record_doctor:unindexed_deleted_at'
            end

            def formatter
              Formatters::UnindexedDeletedAtFormatter
            end
          end
        end
      end
    end
  end
end
