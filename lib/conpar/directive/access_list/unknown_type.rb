module Conpar
  module Directive
    module AccessList
      # Class that matches a basic signature of an AccessList but is not a recognized type
      class UnknownType < Base

        def initialize(content="", options={})
          super
          @sub_ilk = "unknown"
          self
        end#initialize

      end
    end#AccessList
  end#Directive
end#Conpar
