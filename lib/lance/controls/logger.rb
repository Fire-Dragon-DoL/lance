require "lance/logger"
require "lance/refine/multiple"

module Lance
  module Controls
    module Logger
      module_function

      def example(session: nil)
        ::Lance::Logger.new.tap do |instance|
          refiners = []
          refiners << session if !session.nil?
          ::Lance::Refine::Multiple.configure(instance, *refiners)
        end
      end
    end
  end
end
