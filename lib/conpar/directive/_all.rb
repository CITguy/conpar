# Require all Directive Classes
%w[
  base
  empty
  comment
  access_list
].each do |src|
  require_relative "#{src}"
end
