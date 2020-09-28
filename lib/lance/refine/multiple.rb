module Lance
  module Refine
    class Multiple
      def self.build(*refiners)
        refiners = Array(refiners)

        instance = new

        refiners.each do |refine|
          instance.register(refine)
        end

        instance
      end

      def call(message)
        for refine in @refiners
          message = refine.(message)
        end

        message
      end

      def register(refine)
        refiners << refine
      end

      private

      def refiners
        @refiners ||= []
      end
    end
  end

end
