require "rubygems"
require "bundler/setup"
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'appraisal'
require 'action_pusher/testing/application'

task :spec do
  exec('rspec spec')
end

task :default => :spec
