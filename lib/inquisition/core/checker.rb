module Inquisition
  module Core
    class Checker
      def initialize(args = {})
        @args = args
      end

      def call
        check
      end

      private

      def run_cli(command)
        begin
          stdout = Open3.capture3(command).first
        rescue Errno::ENOENT
          stdout = ''
        end
        stdout
      end

      def target_directory
        Dir.pwd
      end

      def destination
        destination = @args[:destination]
        destination ? File.join(target_directory, destination) : target_directory
      end
    end
  end
end
