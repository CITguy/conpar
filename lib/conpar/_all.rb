# Require all Conpar Classes
%w[
  version
  directive
  configuration
  document
].each do |src|
  require_relative "#{src}"
end
