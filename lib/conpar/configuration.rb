module Conpar
  # Class for holding configuration values
  class Configuration
    # @!attribute [rw]
    # @return [Module]
    #   Module Namespace to use with directive matching
    #   Namespace::MyModule.match_with must be defined
    attr_accessor :parser


    def initialize
      # Set default values
      @parser = Conpar::Directive

      # return config object after default values applied
      self
    end#initialize
  end
end
