# ActionPusher
#### Render views to Pusher from anywhere in your application

[Pusher](http://pusher.com/) users often want to transmit JSON or HTML to the browser upon model events, but models have no business generating either. ActionPusher allows you to render data to Pusher using your existing view templates from an observer or model.

## Requirements
* Rails > 3.1
* [Pusher gem](http://rubygems.org/gems/pusher)

## Installation

    gem 'action_pusher', :require => false

Create an initializer at **config/initializers/action_pusher.rb** such as:

    require 'action_pusher'
    ActionPusher::Base.view_paths = File.join( Rails.root, 'app/api' )

Ensure that _view_paths_ points to the location where your templates are actually stored. The default is app/views.

Create a directory at **app/pushers** to store your ActionPusher "controllers".

## Example

**app/pushers/notification_pusher.rb**:

    class NotificationPusher < ActionPusher::Base
      def initialize(notification)
        @notification = notification
        event = @notification.event
        channel = @notification.notification_channel.name
        Pushable.push(channel, event, render(template: 'notifications/show'))
      end

      def controller_path; 'notifications'; end
    end

Now when I call NotificationPusher.new( notification ) from my model callbacks, observers, what-have-you... my Notification model object is transmitted to Pusher as pretty JSON output from [jbuilder](https://github.com/rails/jbuilder)!

## Credit

This gem was inspired by [stephan.com](http://stackoverflow.com/users/444955/stephan-com)'s solution to a question on [StackOverflow](http://stackoverflow.com/questions/6318959/rails-how-to-render-a-view-partial-in-a-model), I just wrapped it up in a gem once I got it working well in production.
