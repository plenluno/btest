require "rspec/core/rake_task"
require 'ci/reporter/rake/rspec'

task :default => [:spec]

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'btest-spec'
  spec.rspec_opts = ['-c']
end
