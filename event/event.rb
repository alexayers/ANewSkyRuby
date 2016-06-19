
# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Event object passed along Event bus

class Event

  def initialize(target,payload)
    @target = target
    @payload = payload
  end

  def target
    return @target
  end

  def payload
    return @payload
  end


end