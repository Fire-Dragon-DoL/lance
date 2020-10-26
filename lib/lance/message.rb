module Lance
  class Message
    attr_accessor :content
    attr_accessor :metadata

    def initialize(content, **metadata)
      @content = content
      @metadata = metadata
    end

    def put(key, value)
      metadata[key] = value
      self
    end

    def get(key)
      metadata[key]
    end

    def fetch(key)
      metadata.fetch(key)
    end
  end
end
