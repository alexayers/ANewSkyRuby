require 'singleton'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Singleton for managing item resources

class ItemManager
  include Singleton

  def initialize
    @itemList = {}
  end

  def registerItem(item)
    @itemList[item.getTitle] = item
  end

  def getItem(title)
    if @itemList.key?(title)
      return @itemList[title]
    end

  end

end