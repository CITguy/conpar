module Conpar
  module Directive
    # Class for line that contains only whitespace
    class Empty < Base
      SIGNATURE = /^\s*$/
      def initialize(content, options={})
        super
        @ilk = :empty
      end
    end
  end#Directive
end#Conpar
