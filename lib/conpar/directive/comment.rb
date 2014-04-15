module Conpar
  module Directive
    # Class for a commented line
    class Comment < Base
      SIGNATURE = /^\:(.*)?$/

      def initialize(content="", options={})
        super
        @ilk = :comment
        @sub_ilk = "comment"
      end
    end
  end
end
