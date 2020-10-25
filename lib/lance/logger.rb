require "dependency"
require "configure"
require "lance/output/console"
require "lance/refine/multiple"

module Lance
  class Logger
    include ::Dependency
    include ::Configure

    dependency :output, ::Lance::Output::Console
    dependency :refine, ::Lance::Refine::Multiple

    configure :logger

    def self.build(session: nil)
      new.tap do |instance|
        refiners = []
        refiners << session if !session.nil?

        ::Lance::Output::Console.configure(instance)
        ::Lance::Refine::Multiple.configure(instance, *refiners)
      end
    end

    def put(message)
      message = refine.(message)
      output.(message)
    end
  end
end
