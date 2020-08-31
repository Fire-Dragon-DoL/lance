require_relative "../../load_path"
require "lance"

class Subject1
  include ::Lance::Log::Dependency
end

class InspectLog
  include ::Lance::Logger

  def build_log
    ::Lance::Log.new
  end
end

subject = Subject1.new
subject.log = ::Lance::Log.get(subject)
subject = Subject1.new
subject.log.info("Message 1", tags: [:a_tag, :another_tag], field: 123, name: "A name")
subject.log.info(tags: [:a_tag, :another_tag], field: 123, name: "A name") do
  "Message 2"
end
