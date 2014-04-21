module Conpar
  module Directive
    module AccessList
      # Class that maps directly to Cisco extended ACL definition
      # See http://www.cisco.com/c/en/us/td/docs/security/asa/asa91/configuration/general/asa_91_general_config/acl_extended.html
      class Extended < Base
        # (0.1.4): "extended" should be followed by "permit" or "deny"
        SIGNATURE = /^(access-list)\b.*\s(extended)\s+(permit|deny)\s/i

        def initialize(content="", options={})
          super

          @sub_ilk = "extended"

          # host (ipaddr) mask (ipaddr)
          ipaddr_regex = %r/
            (?<octet>1?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))\.\k<octet>\.\k<octet>\.\k<octet>
          /x

          # access-list access_list_name [line line_number] extended
          # {deny | permit} protocol_argument source_address_argument dest_address_argument
          # [log [[level] [interval secs] | disable | default]]
          # [inactive | time-range time_range_name]
          parse_regex = %r/^
            (access-list)\s*                 # Directive Signature
            (?<name>#{NAME})\s*              # ACL Name
            (line\s+(?<line>\d+))?\s*        # (optional) line number
            (?<type>extended)\s*             # ACL type
            (?<permission>(permit|deny))?\s* # permit or deny
            (?<protocol>\w+)\s*              # Protocol Argument
            (?<rule>.+)                      # Everything else on line
          $/x
          @match_data = parse_regex.match(@content)

          self
        end#initialize

        # Method for each match name in the parsed match data (see regex above)
        [ :name,
          :permission,
          :rule,
          # Additional for :extended ACL directive
          :line,
          :protocol
        ].each do |m|
          define_method(m) do
            @match_data[m]
          end
        end
      end
    end
  end
end
