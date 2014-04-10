require 'conpar/directive/access_list/_all'

module Conpar
  module Directive
    # Module for ACL line classes
    # See http://www.cisco.com/c/en/us/td/docs/security/asa/asa91/configuration/general/asa_91_general_config/acl_overview.html
    module AccessList
      extend self

      SIGNATURE = Base::SIGNATURE

      def new(line, options={})
        # Shallow ACL Test - Is the line any type of ACL?
        if line =~ SIGNATURE
          # Deeper ACL Testing - Which type of ACL is it?
          [
            Standard,
            Extended,
            WebType,
            EtherType
          ].each do |klass|
            if line =~ klass::SIGNATURE
              return klass.new(line, options)
            end
          end
          # If no match yet, use base ACL type
          return UnknownType.new(line, options)
        end
      end#new

    end
  end
end
