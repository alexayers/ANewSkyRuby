require_relative '../event/eventbus'
require_relative '../containers/inventory'
require_relative '../managers/audiomanager'
require_relative 'clickbox'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Door object for moving between scenes

class Door < ClickBox

  def initialize(lx, ly, hx, hy)
    super
    @key = nil
    @isLocked = false
    return self
  end

  def destination(destination)
    @destination = destination
    return self
  end

  def walkSound(filename)
    @walkSound = filename
    return self
  end

  def lockDoor
    @isLocked = true
    return self
  end

  def key(key)
    @isLocked = true
    @key = key
    return self
  end

  def isPointWithinDoor(x, y)

    if x >= @lx &&
        x <= @hx &&
        y >= @ly &&
        y <= @hy

      if @clickSound != nil
        AudioManager.instance.play(@clickSound)
      end

      if @isLocked
        if Inventory.instance.selectedItem != nil
          if Inventory.instance.selectedItem.getTitle != @key
            return true
          elsif @isLocked && Inventory.instance.selectedItem.getTitle == @key
            @isLocked = false
            Inventory.instance.dropSelected
          end
        else
          return true
        end
      end

      if (@walkSound != nil)
        AudioManager.instance.play(@walkSound)
      end


      EventBus.instance.publishEvent(Event.new('sceneManager', @destination))
      return true
    else
      return false
    end
  end

  def processEvent(event)
      if event.payload == 'unlock'
        @isLocked = false
      end
  end


end