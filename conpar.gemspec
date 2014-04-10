# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conpar/version'

Gem::Specification.new do |spec|
  spec.name          = "conpar"
  spec.version       = Conpar::VERSION
  spec.authors       = ["Ryan A. Johnson"]
  spec.email         = ["ryan.johnson@rackspace.com"]
  spec.summary       = %q{Firewall CONfig PARser}
  spec.description   = %q{Full-featured firewall configuration parser library.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", ">= 2.4.0"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "yard"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
end
