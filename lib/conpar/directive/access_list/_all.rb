# Require all AccessList Classes
%w[
  base
  standard
  extended
  ether_type
  web_type
  unknown_type
].each do |src|
  require_relative "#{src}"
end
