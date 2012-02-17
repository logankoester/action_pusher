require "action_pusher/version"

module ActionPusher
  class Base < AbstractController::Base
    include AbstractController::Rendering
    include AbstractController::Helpers
    include AbstractController::Translation
    include AbstractController::AssetPaths
    include Rails.application.routes.url_helpers

    helper ApplicationHelper
    self.view_paths = File.join( Rails.root, 'app/views' )

    class Pushable
      def self.push(channel, event, data)
        @channel, @event, @data = channel, event, data
        Pusher[@channel].trigger(@event, @data )
      end
    end
  end
end
