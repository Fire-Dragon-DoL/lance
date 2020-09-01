module Lance
  class Filter
    class AllTags
      def initialize(tags)
        @tags = tags
      end

      def call(message)
        message_tags = message.metadata(:tags)

        if @tags.superset?(message_tags)
          return :include
        end

        :exclude
      end
    end
  end
end
