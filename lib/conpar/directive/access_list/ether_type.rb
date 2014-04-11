module Conpar
  module Directive
    module AccessList
      # Class that maps directly to Cisco ethertype ACL definition
      # See http://www.cisco.com/c/en/us/td/docs/security/asa/asa91/configuration/general/asa_91_general_config/acl_ethertype.html
      class EtherType < Base
        SIGNATURE = /^(access-list)\b.*\b(ethertype)\b/i

        def initialize(content="", options={})
          super

          @sub_ilk = "ethertype"

          parse_regex = %r/
            (access-list)\s* # Directive Signature
            (?<name>[\-\w]+)\s* # ACL Name
            (?<type>(ethertype))\s* # Ethertype ACL Type
            (?<permission>(permit|deny))?\s* # permit or deny
            (?<rule>.+)
          /x
          @match_data = parse_regex.match(@content)

          self
        end#initialize

        # Method for each match name in the parsed match data (see regex above)
        [ :name,
          :permission,
          :rule
        ].each do |m|
          define_method(m) do
            @match_data[m]
          end
        end

      end
    end
  end
end#Conpar
