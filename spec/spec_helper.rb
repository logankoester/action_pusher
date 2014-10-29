ENV['RAILS_ENV'] ||= 'test'

PROJECT_ROOT = File.expand_path('../..', __FILE__)
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')

require 'rails/all'
require 'rails/test_help'

require 'action_pusher/testing/application'
require 'rspec/rails'

Bundler.require

ActionPusher::Base.view_paths = File.join(PROJECT_ROOT, 'lib',
  'action_pusher/testing/app/views')

ActionPusher::Testing::Application.initialize!

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end
