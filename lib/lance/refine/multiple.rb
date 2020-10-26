require "lance/refine/nothing"
require "lance/refine/session"

module Lance
  module Refine
    class Multiple
      module Substitute
        def self.build
          Nothing.build
        end
      end

      module Defaults
        def self.refiners
          [
            Session.build
          ]
        end
      end

      def initialize(refiners = [])
        @refiners = refiners
      end

      def self.build(refiners = nil)
        refiners ||= Defaults.refiners

        new(refiners)
      end

      def self.configure(instance, refiners = nil)
        instance.refine = build(refiners)
      end

      def call(message)
        for refine in refiners
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
