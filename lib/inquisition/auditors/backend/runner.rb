module Inquisition
  module Auditors
    module Backend
      class Runner < Core::BaseRunner
        class << self
          private

          def runners
            {
              # Fasterer::Runner => config_path(:fasterer),
              # Reek::Runner => config_path(:reek),
              # Dawnscanner::Runner => config_path(:dawnscanner),
              # BundlerAudit::Runner => config_path(:bundler_audit),
              # RailsBestPractices::Runner => config_path(:rails_best_practices),
              # Rubocop::Runner => config_path(:rubocop),
              # RubyLint::Runner => config_path(:ruby_lint),
              # Yamllint::Runner => config_path(:yamllint),
              # LolDba::Runner => config_path(:lol_dba),

              # ActiveRecordDoctor::Runners::ExtraneousIndexesRunner => config_path(:active_record_doctor)
              # ActiveRecordDoctor::Runners::MissingForeignKeysRunner => config_path(:active_record_doctor)

              # ActiveRecordDoctor::Runners::MissingNonNullConstraintRunner => config_path(:active_record_doctor)
              # ActiveRecordDoctor::Runners::MissingPresenceValidationRunner => config_path(:active_record_doctor)
              # ActiveRecordDoctor::Runners::MissingUniqueIndexesRunner => config_path(:active_record_doctor)
              # ActiveRecordDoctor::Runners::UndefinedTableReferencesRunner => config_path(:active_record_doctor)
              # ActiveRecordDoctor::Runners::UnindexedDeletedAtRunner => config_path(:active_record_doctor)
              ActiveRecordDoctor::Runners::UnindexedForeignKeysRunner => config_path(:active_record_doctor)

              # Bullet::Runner => config_path(:bullet),
              # HamlLint::Runner => config_path(:haml_lint),
              # RailsErd::Runner => config_path(:rails_erd),
              # RubocopRspec::Runner => config_path(:rubocop_rspec),
              # Simplecov::Runner => config_path(:simplecov),
              # SlimLint::Runner => config_path(:slim_lint)
            }
          end

          def config_path(*path)
            [:linters, :backend, *path]
          end
        end
      end
    end
  end
end
