require 'gosu'
require_relative '../containers/inventory'
require_relative '../managers/audiomanager'
require_relative 'clickbox'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Items (things that can be picked up) and hitboxes (Things that can't be picked up)

class Item < ClickBox

  def initialize(lx,ly,hx,hy)
    super

    @imageExamine = nil
    @value = ''
    @canGrab = false
    @onScreen = false
    @canClick = false
    @canExamine = false
    @callBack = nil

    return self
  end

  def filename(filename)
    @image = Gosu::Image.new('resources/objects/' + filename, :retro => true)
    return self
  end

  def value(value)
    @value = value
    return self
  end

  def getValue
    return @value
  end

  def callback(&block)
    @callBack = block
    return self
  end

  def clickable
    @canClick = true
    return self
  end

  def makeUnclickable
    @canClick = false
    return self
  end

  def grabable
    @canGrab = true
    return self
  end

  def onScreen
    @onScreen = true
    return self
  end

  def image
    return @image
  end

  def getExamineImage
    if @imageExamine == nil
      return @image
    else
      return @imageExamine
    end

  end

  def render
    if @image != nil && @onScreen
      @image.draw(@lx, @ly,0)
    end
  end

  def isPointWithinItem(x,y)

    if !@canGrab && !@canClick
      return
    end

    if isPointInSquare(x,y)

      if @clickSound != nil
        AudioManager.instance.play(@clickSound)
      end

        if @canGrab && @onScreen
          @onScreen = false
          Inventory.instance.addToInventory(self)
        elsif @canClick
          if @callBack != nil
            @callBack.call
          end
        end


    end
  end


end