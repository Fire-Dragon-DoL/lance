require "configure"

module Lance
  module Refine
    class Nothing
      include ::Configure

      module Substitute
        def self.build
          Nothing.new
        end
      end

      def self.build
        new
      end

      configure :refine

      def call(message)
        message
      end
    end
  end
end
