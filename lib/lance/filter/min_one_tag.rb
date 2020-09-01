module Lance
  class Filter
    class MinOneTag
      def initialize(tags)
        @tags = tags
      end

      def call(message)
        message_tags = message.metadata(:tags)

        if message_tags.intersect?(@tags)
          return :include
        end

        :exclude
      end
    end
  end
end
