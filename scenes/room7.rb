require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Ladder to beach

class Room7 < Scene

  def initialize
    super
    addBackgroundImage('room7/room7_1b.png')
    addBackgroundImage('room7/room7_2b.png')
    addBackgroundImage('room7/room7_3b.png')

    addMiddlegroundImage('room7/room7_1m.png')

    addDoor(Door.new(0, 0, 63, 350,'room6','walk_sand.ogg'))
    addDoor(Door.new(281, 0, 350, 350,'room8','walk_sand.ogg'))
    addDoor(Door.new(132, 187, 201, 243,'room20','walk_ladder.ogg'))

    addAmbience('wind.ogg')
  end


end