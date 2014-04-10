require "conpar/_all"

# Gem Root Namespace
module Conpar
  extend self

  # Modify configuration for library
  # @yield [Configuration]
  def configure
    yield self.config if block_given?
  end


  # @return [Configuration]
  def config
    @@config ||= Configuration.new
  end#config
end
