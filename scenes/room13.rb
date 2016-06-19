require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Outside cave

class Room13 < Scene

  def initialize
    super
    addBackgroundImage('room13/room13_1b.png')

    addDoor(Door.new(0, 0, 63, 350,'room12','walk_sand.ogg'))
    addDoor(Door.new(283, 0, 350, 350,'room14','walk_sand.ogg'))
    addDoor(Door.new(114, 88, 265, 257,'room15','walk_sand.ogg'))

    addAmbience('waves.ogg')
  end


end