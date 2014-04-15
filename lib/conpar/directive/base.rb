module Conpar
  module Directive
    # Base class for all Directives
    class Base
      SIGNATURE = /^(.*)$/ # Matches any non-empty string

      # @!attribute [rw] line_number
      # @return [Integer]
      #   1-based line number within the configuration
      attr_accessor :line_number

      # @!attribute [rw] line_span
      # @return [Integer]
      #   Number of lines this directive spans within the configuration
      attr_accessor :line_span

      # @!attribute [r] content
      # @return [String]
      #   directive content
      attr_reader :content

      # @!attribute [r] ilk
      # @return [Symbol]
      #   shorthand type of directive
      attr_reader :ilk

      # @!attribute [r] sub_ilk
      # @return [String]
      #   a.k.a. "sub type"
      attr_reader :sub_ilk

      # @!attribute [r] match_data
      # @return [MatchData]
      #   This value is to be set internally by subclasses
      attr_reader :match_data

      # @!attribute [r] rule
      # @return [String]
      attr_reader :rule


      def initialize(content="", options={})
        @line_number = options[:line_number]
        @line_span = options.fetch(:line_span, 1)
        @content = content.to_s.strip
        @ilk = :directive
        @sub_ilk = ""
        self
      end#initialize
    end
  end
end
