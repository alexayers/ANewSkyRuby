require_relative 'event/eventbus'
require_relative 'inventory'
require_relative 'audioManager'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Door object for moving between scenes

class Door

  def initialize(lx, ly, hx, hy, destination, walkSound, isLocked = false)
    @lx = lx
    @ly = ly
    @hx = hx
    @hy = hy
    @title = nil
    @key = nil
    @destination = destination
    @isLocked = isLocked
    @clickSound = nil
    @walkSound = walkSound

    return self
  end

  def clickSound(filename)
    @clickSound = filename
    return self
  end

  def key(key)
    @isLocked = true
    @key = key
    return self
  end

  def title(title)
    @title = title
    return self
  end

  def getTitle
    return @title
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