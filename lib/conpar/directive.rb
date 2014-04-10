require 'conpar/directive/_all'

module Conpar
  # Namespace for any type of configuration directive
  module Directive
    extend self

    # @param [String] line
    #   This is the current line being iterated
    # @param [Hash] options (common options among all Directives)
    # @option [Integer] line_number
    #   On which line number does the directive appear
    def new(line, options={})
      [
        Empty,
        Comment,
        # Additional directive classes/modules below
        AccessList
      ].each do |klass|
        if line =~ klass::SIGNATURE
          return klass.new(line, options)
        end
      end

      # Catch-all Directive
      return Base.new(line, options)
    end#new

  end#Directive
end
