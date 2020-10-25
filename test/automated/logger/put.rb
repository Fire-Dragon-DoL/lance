require "lance/controls/logger"
require "lance/controls/message"
require "lance/output/diagnostic"

context "Lance" do
  context "Logger" do
    context "Put" do
      logger = ::Lance::Controls::Logger.example
      message = ::Lance::Controls::Message.example
      sink = ::Lance::Output::Diagnostic.register_telemetry_sink(logger.output)

      logger.put(message)
      record = sink.records.last

      test "Outputs message" do
        assert(record.data == message)
      end
    end
  end
end
