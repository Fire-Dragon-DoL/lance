require "lance/refine/nothing"
require "lance/logger/level"
require "lance/logger/tag"

module Lance
  module Refine
    class Session
      module Substitute
        def self.build
          Nothing.new
        end
      end

      attr_accessor :filter_level
      attr_accessor :filter_tags

      def initialize(filter_level, filter_tags)
        @filter_level = filter_level
        @filter_tags = filter_tags
      end

      def self.build(source = nil)
        source ||= ENV

        filter_level, filter_tags = parse(source)

        new(filter_level, filter_tags)
      end

      def self.parse(source = nil)
        source ||= ENV

        filter_level = source.fetch("LOG_LEVEL") { "trace" }
        filter_level = ::Lance::Logger::Level.parse(filter_level)

        filter_tags = source.fetch("LOG_TAGS") { "_all" }
        filter_tags = ::Lance::Logger::Tag.parse(filter_tags)

        [filter_level, filter_tags]
      end

      def self.configure(instance, source: nil)
        instance.refine = build(source)
      end

      def call(message)
        message.put(:filter_level, filter_level)
        message.put(:filter_tags, filter_tags)
      end
    end
  end

end
