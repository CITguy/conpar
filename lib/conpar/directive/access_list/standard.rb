module Conpar
  module Directive
    module AccessList
      # Class that maps directly to Cisco standard ACL definition
      # See http://www.cisco.com/c/en/us/td/docs/security/asa/asa91/configuration/general/asa_91_general_config/acl_standard.html
      class Standard < Base
        # (0.1.4): "standard" should be followed by "permit" or "deny"
        SIGNATURE = /^(access-list)\b.*\s(standard)\s+(permit|deny)/i

        def initialize(content="", options={})
          super

          @sub_ilk = "standard"

          # access-list access_list_name standard
          # { deny | permit } { any4 | ip_address mask }
          parse_regex = %r/^
            (access-list)\s*                 # Directive signature
            (?<name>#{NAME})\s*              # ACL Name
            (?<type>(standard))\s*           # Standard ACL Type
            (?<permission>(permit|deny))?\s* # permit or deny
            (?<rule>.+)                      # Everything else on line
          $/x
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
end
