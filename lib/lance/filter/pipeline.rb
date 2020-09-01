module Lance
  class Filter
    class Pipeline
      def initialize(filters)
        @filters = filters
      end

      def call(message)
        for filter in @filters
          return :exclude if filter.(message) == :exclude
        end

        :include
      end
    end
  end
end
