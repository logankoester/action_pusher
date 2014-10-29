require 'action_pusher'

class TestPusher < ActionPusher::Base

  def initialize
    data = render(:template => 'test/show', :formats => [:json])
    Pushable.push('channel', 'event', data)
  end

end
