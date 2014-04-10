module Conpar
  module Directive
    module AccessList
      # Base class for all AccessList classes
      class Base < Conpar::Directive::Base
        SIGNATURE = /^(access-list)\b/

        def initialize(content="", options={})
          super
          @ilk = :access_list
          @sub_ilk = :base
        end#initialize

        def to_s
          @content
        end
      end
    end
  end
end
