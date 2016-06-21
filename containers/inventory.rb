require 'singleton'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Player inventory

class Inventory
  include Singleton

  def initialize
    @slots = Array.new(6)
    @isExamining = false
    @selectedIdx = -1
    @xOffset = 30
    @yOffset = 360
    @highlight = Gosu::Image.new('resources/objects/highlight.png', :retro => true)

  end

  def render
    _idx = 0
    _offset = 10

    @slots.each {
        |item|
      if item != nil
        item.image.draw(_offset, 360, 0)

        if _idx == @selectedIdx
          @highlight.draw(_offset, 360, 0)
        end

      end

      _idx += 1
      _offset += 32

    }

    if @isExamining
      @slots[@selectedIdx].getExamineImage.draw(12,5,0,10,10)
    end

  end

  def processClick(isLeftClick, isRightClick, mousePosition)

    _idx = 0
    _offset = 10
    _x = mousePosition['mouseX']
    _y = mousePosition['mouseY']

    @slots.each {
        |item|
      if item != nil

        if _x >= _offset &&
            _x <= _offset + 32 &&
            _y >= 360 &&
            _y <= 400

          if isLeftClick
            @isExamining = false
            @selectedIdx = _idx
          elsif isRightClick
            @selectedIdx = _idx

            if @isExamining
              @isExamining = false
            else
              @isExamining = true
            end
          end
        end
      end

      _idx += 1
      _offset += 32
    }

  end

  def isExamining
    return @isExamining
  end

  def dropSelected
    @slots[@selectedIdx] = nil
    @selectedIdx = -1
  end

  def selectedItem
    if @selectedIdx == -1
      return nil
    else
      return @slots[@selectedIdx]
    end

  end

  def isSelectedItem(itemName)
    if selectedItem != nil
      if selectedItem.getTitle == itemName
        return true
      else
        return false
      end
    else
      return false
    end

  end

  def addToInventory(itemToAdd)
    _idx = 0

    @slots.each {
        |item|
      if item == nil
        @slots[_idx] = itemToAdd
        return
      end

      _idx += 1
    }
  end


end