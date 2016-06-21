require_relative '../containers/animatedframe'
require_relative '../clickable/door'
require_relative '../managers/itemmanager'
require_relative '../managers/audiomanager'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Class for organizing scene components: doors, items, animated frames, etc

class Scene

  def initialize
    @background = AnimatedFrame.new
    @middleground = AnimatedFrame.new
    @foreground = AnimatedFrame.new
    @items = Array.new
    @doors = Array.new
    @ambientSound = nil
    @clickCallBack = nil
    @renderCallBack = nil
  end

  def addBackgroundImage(filename)
    @background.addImage('resources/art/rooms/' + filename)
  end

  def clearBackground
    @background = AnimatedFrame.new
  end

  def clearForeground
    @foreground = AnimatedFrame.new
  end

  def clearMiddleground
    @middleground = AnimatedFrame.new
  end

  def addMiddlegroundImage(filename)
    @middleground.addImage('resources/art/rooms/' + filename)
  end

  def addForegroundImage(filename)
    @foreground.addImage('resources/art/rooms/' + filename)
  end

  def addAmbience(ambientSound)
    @ambientSound = ambientSound
  end

  def ambienceName
    return @ambientSound
  end

  def clickCallBack(&block)
    @clickCallBack = block
    return self
  end

  def renderCallBack(&block)
    @renderCallBack = block
    return self
  end

  def playAmbience
    if @ambientSound != nil
     AudioManager.instance.playLooped(@ambientSound)
    end

  end

  def addItem(item)
    ItemManager.instance.registerItem(item)
    @items.push(item)
  end

  def stopAmbience
    AudioManager.instance.stop(@ambientSound)
  end

  def addDoor(door)
    if door.getTitle != nil
      EventBus.instance.registerListener(door.getTitle,door)
    end

    @doors.push(door)
  end

  def doors
    return @doors
  end

  def items
    return @items
  end

  def render

    if @background.size > 0
      @background.render
    end

    if @middleground.size > 0
      @middleground.render
    end

    @items.each {
        |item|
      item.render
    }

    if @foreground.size > 0
      @foreground.render
    end

    if @renderCallBack != nil
      @renderCallBack.call
    end


  end

  def processClick(x,y)

    @items.each {
        |item|
      if item.isPointWithinItem(x, y)
        return
      end
    }

    @doors.each {
        |door|
      door.isPointWithinDoor(x, y)

    }

    if @clickCallBack != nil
      @clickCallBack.call(x,y)
    end
  end

  def processEvent(event)

  end

end