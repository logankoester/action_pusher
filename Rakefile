require "rubygems"
require "bundler/setup"
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'appraisal'
require 'action_pusher/testing/application'

ActionPusher::Testing::Application.load_tasks

task :default => [:all]

task :all do |t|
  if ENV['BUNDLE_GEMFILE']
    exec('rake spec')
  else
    exec("rm gemfiles/*.lock")
    Rake::Task["appraisal:gemfiles"].execute
    Rake::Task["appraisal:install"].execute
    exec('rake appraisal')
  end
end

RSpec::Core::RakeTask.new(:spec)
