module Conpar
  module Directive
    module AccessList
      # Class that maps directly to Cisco webtype ACL definition
      # See http://www.cisco.com/c/en/us/td/docs/security/asa/asa91/configuration/general/asa_91_general_config/acl_webtype.html
      class WebType < Base
        SIGNATURE = /^(access-list)\b.*\b(webtype)\b/i

        def initialize(content="", options={})
          super

          @sub_ilk = "webtype"

          parse_regex = %r/
            (access-list)\s*                 # Directive Signature
            (?<name>[\-\w]+)\s*              # ACL name
            (?<type>(webtype))\s*            # Webtype ACL Type
            (?<permission>(permit|deny))?\s* # permit or deny
            (?<rule>.+)                      # Everything else on line
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
            begin
              @match_data[m]
            rescue IndexError
              nil
            end
          end
        end
      end
    end#AccessList
  end#Directive
end#Conpar
