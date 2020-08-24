module Lance
  class Message
    attr_accessor :content
    attr_accessor :metadata

    attr_writer :render
    attr_writer :filter

    def initialize(content, metadata = {})
      @content = content
      @metadata = metadata
    end

    def tags
      metadata.fetch(:tags) { [] }
    end

    def level
      metadata.fetch(:level) { :trace }
    end

    def to_s
      render.(self)
    end

    def render
      @render ||= ::Lance::Render.new
    end

    def filter
      @filter ||= ::Lance::Filter.new
    end
  end
end
