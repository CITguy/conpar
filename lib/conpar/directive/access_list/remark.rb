module Conpar
  module Directive
    module AccessList
      # Class that maps directly to Cisco Commented ACL
      # See http://www.cisco.com/c/en/us/support/docs/security/ios-firewall/23602-confaccesslists.html#comments
      class Remark < Base
        SIGNATURE = /^(access-list)\b.*\b(remark)\b/i

        def initialize(content="", options={})
          super
          @sub_ilk = "remark"

          # access-list access_list_name remark remark_content
          parse_regex = %r/^
            (access-list)\s* # Directive Signature
            (?<name>#{NAME})\s* # ACL Name
            (?<type>remark)\s* # ACL Type
            (?<remark>.+) # Everything else on line
          $/x
          @match_data = parse_regex.match(@content)
        end#initialize

        [ :name,
          :type,
          :remark
        ].each do |m|
          define_method(m) do
            @match_data[m]
          end
        end
      end#Remark
    end#AccessList
  end#Directive
end#Conpar
