require "set"

module Lance
  class Logger
    module Level
      module_function

      Names = [
        :trace,
        :debug,
        :info,
        :warn,
        :error,
        :fatal
      ].freeze
      List = Set.new(Names).freeze

      def level?(level)
        List.include?(level.to_sym)
      end

      def parse(level)
        level = level.to_sym
        raise ArgumentError, "level" unless level?(level)

        level
      end
    end
  end
end
