require 'gosu'
require_relative 'inventory'
require_relative 'audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Items (things that can be picked up) and hitboxes (Things that can't be picked up)

class Item

  def initialize(lx,ly,hx,hy)
    @lx = lx
    @ly = ly
    @hx = hx
    @hy = hy

    @title = ''
    @image = nil
    @imageExamine = nil
    @value = ''
    @clickSound = nil

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

  def title(title)
    @title = title
    return self
  end

  def clickSound(clickSound)
    @clickSound = clickSound
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

  def getTitle
    return @title
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

    if x >= @lx &&
        x <= @hx &&
        y >= @ly &&
        y <= @hy

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