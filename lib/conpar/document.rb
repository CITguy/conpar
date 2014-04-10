module Conpar
  class Document
    # @param [String] fw_config
    #   Firewall configuration as string
    # @return [Array]
    #   Array of Directive objects with which to perform logic
    def self.parse(fw_config)
      if fw_config.class != String
        raise ArgumentError, "fw_config must be string"
      end

      parsed = []
      lines = fw_config.split("\n")

      lines.each_with_index do |line, i|
        human_line = i+1
        parsed << Conpar.config.parser.new( line, line_number:human_line )
      end

      return parsed
    end#self.parse

  end
end
