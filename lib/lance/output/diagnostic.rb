module Lance
  module Output
    class Diagnostic
      def self.build
        new
      end

      def call(message)
        message
      end
    end
  end
end
