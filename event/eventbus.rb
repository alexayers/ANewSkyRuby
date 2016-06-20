require 'singleton'
require_relative 'event'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Simple event bus for passing messages between listeners

class EventBus
  include Singleton

  def initialize
    @listeners = {}
  end

  def registerListener(listenerName,clazz)

    @listeners[listenerName] = clazz

  end

  def publishEvent(event)

    if @listeners.key?(event.target)
      begin
        @listeners[event.target].processEvent(event)
      rescue
        puts 'Unable to deliver event ' + event.target
      end
    else
      puts 'Unknown event target ' + event.target
    end

  end



end