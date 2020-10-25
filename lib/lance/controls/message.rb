require "lance/message"
require "identifier/uuid"

module Lance
  module Controls
    module Message
      module_function

      def example
        content = Identifier::UUID::Random.get
        ::Lance::Message.new(content)
      end
    end
  end
end
