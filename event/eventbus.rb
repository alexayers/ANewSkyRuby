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
      @listeners[event.target].processEvent(event)
    else
      puts 'Unknown event target ' + event.target
    end

  end



end