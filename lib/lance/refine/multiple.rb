module Lance
  module Refine
    class Multiple
      module Substitute
        def self.build
          Multiple.new
        end
      end

      def initialize(*refiners)
        @refiners = refiners
      end

      def self.build(*refiners)
        new(*refiners)
      end

      def self.configure(instance, *refiners)
        instance.refine = build(*refiners)
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
