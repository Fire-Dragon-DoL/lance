require "lance/logger"
require "lance/refine/multiple"

module Lance
  module Controls
    module Logger
      module_function

      def example(session: nil)
        ::Lance::Logger.new.tap do |instance|
          ::Lance::Refine::Multiple.configure(instance)
        end
      end
    end
  end
end
