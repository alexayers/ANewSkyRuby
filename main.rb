require 'gosu'
require_relative 'scenemanager'
require_relative 'inventory'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Entry point to program

class GameWindow < Gosu::Window
  def initialize(width=350, height=400, fullscreen=false)
    super
    self.caption = 'A New Sky'

    @sceneManager = SceneManager.new
    @mousePosition = {}
    @isLeftClick = nil
    @isRightClick = nil

  end

  def needs_cursor?; true; end

  def button_down(id)

    @mousePosition = {'mouseX' => mouse_x, 'mouseY' => mouse_y}

    case id
      when Gosu::MsLeft
        @isLeftClick = true
        @isRightClick = false
      when Gosu::MsRight
        @isLeftClick = false
        @isRightClick = true
    end

  end

  def draw
    @sceneManager.render

    if !Inventory.instance.isExamining && @isLeftClick
      @sceneManager.processClick(@mousePosition)
    end

    Inventory.instance.render
    Inventory.instance.processClick(@isLeftClick,@isRightClick,@mousePosition)

    @isLeftClick = false
    @isRightClick = false

  end
end

window = GameWindow.new
window.show