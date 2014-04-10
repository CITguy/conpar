require "bundler/gem_tasks"

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w[-c]
end

task default: :spec
task test: :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'conpar'
  ARGV.clear
  IRB.start
end

task :pry do
  require 'pry'
  require 'conpar'
  ARGV.clear
  Pry.start
end
