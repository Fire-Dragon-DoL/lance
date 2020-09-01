module Lance
  class Filter
    class ExcludeTags
      def initialize(tags)
        @tags = tags
      end

      def call(message)
        message_tags = message.metadata(:tags)

        if @tags.intersect?(message_tags)
          return :exclude
        end

        :include
      end
    end
  end
end
