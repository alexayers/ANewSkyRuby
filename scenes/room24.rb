require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Cave Computer

class Room24 < Scene

  def initialize
    super
    addBackgroundImage('room24/room24_1b.png')
    addDoor(Door.new(315, 0, 350, 350,'room15','walk_building.ogg'))
    addAmbience('cave.ogg')

  end

  def processEvent(event)
    clearBackground
    addBackgroundImage('room24/room24_1bb.png')

    addDoor(Door.new(134, 89, 234, 168,'room32','walk_sand.ogg'))

  end

end