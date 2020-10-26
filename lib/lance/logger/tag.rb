require "set"

module Lance
  class Logger
    module Tag
      module_function

      def parse(tags)
        tags.split(",").map(&:strip)
      end
    end
  end
end
