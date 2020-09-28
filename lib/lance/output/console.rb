require "configure"
require "lance/output/diagnostic"

module Lance
  module Output
    class Console
      module Substitute
        def self.build
          ::Lance::Output::Diagnostic.build
        end
      end
    end
  end
end
