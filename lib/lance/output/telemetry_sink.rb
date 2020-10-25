require "telemetry"

module Lance
  module Output
    class TelemetrySink
      include Telemetry::Sink

      record :put
    end
  end
end
