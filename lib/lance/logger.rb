require "dependency"
require "configure"
require "lance/output/console"

module Lance
  class Logger
    include ::Dependency
    include ::Configure

    # dependency session?
    dependency :output, ::Lance::Output::Console
    dependency :refine, ::Lance::Refine::Multiple

    configure :logger

    def put(message)
      message = refine.(message)
      output.(message)
    end
  end
end
