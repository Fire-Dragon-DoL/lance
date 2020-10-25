require "configure"
require "dependency"
require "telemetry"
require "lance/output/telemetry_sink"

module Lance
  module Output
    class Diagnostic
      include ::Configure
      include ::Dependency

      dependency :telemetry, Telemetry

      def self.build
        new.tap do |instance|
          Telemetry.configure(instance)
        end
      end

      def self.register_telemetry_sink(instance)
        TelemetrySink.new.tap do |sink|
          instance.telemetry.register(sink)
        end
      end

      configure :output

      def call(message)
        telemetry.record(:put, message)

        message
      end
    end
  end
end
