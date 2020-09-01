module Lance
  class Filter
    # Excludes messages from output
    #
    # @param [#metadata] message the message to filter
    # @return [:include, :exclude]
    # @abstract
    def call(message)
    end
  end
end
