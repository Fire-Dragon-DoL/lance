# require "lance"
# require "identifier/uuid"

# context "Log" do
#   context "Filter" do
#     context "Any Tag" do
#       # TODO: How to configure the logger?
#       log = ::Lance::Log.new
#       sink = ::Lance::Log::TelemetrySink.new
#       log.telemetry.register(sink)

#       context "Messages with no tags" do
#         log.info("A message")
#         records = sink.records

#         logged = records.empty?

#         test "Are not logged" do
#           refute(logged)
#         end
#       end

#       context "Messages with no matching tags" do
#         log.info("A message", tags: [:not_matching])
#         records = sink.records

#         logged = records.empty?

#         test "Are not logged" do
#           refute(logged)
#         end
#       end

#       context "Messages with one matching tag" do
#         content = "A message" + Identifier::UUID::Random.get
#         log.info(content, tags: [:a_tag])
#         records = sink.records
#         record = records.first

#         logged = record.data.message.content == content

#         test "Are logged" do
#           assert(logged)
#         end
#       end

#       context "Messages with multiple matching tags" do
#         content = "A message" + Identifier::UUID::Random.get
#         log.info(content, tags: [:a_tag, :another_tag])
#         records = sink.records
#         record = records.first

#         logged = record.data.message.content == content

#         test "Are logged" do
#           assert(logged)
#         end
#       end
#     end
#   end
# end
