require "rubygems"
require "bundler/setup"
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'appraisal'
require 'action_pusher/testing/application'

ActionPusher::Testing::Application.load_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
