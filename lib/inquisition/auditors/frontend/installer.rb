module Inquisition
  module Auditors
    module Frontend
      class Installer < Core::BaseInstaller
        class << self
          private

          def installers
            {
              I18nTasks::Installer => config_path(:i18n_tasks)
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
