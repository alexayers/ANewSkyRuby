require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Cockpit

class Room23 < Scene

  def initialize
    super
    addBackgroundImage('room23/room23_1b.png')

    addMiddlegroundImage('room23/room23_1m.png')
    addMiddlegroundImage('room23/room23_2m.png')
    addMiddlegroundImage('room23/room23_3m.png')
    addMiddlegroundImage('room23/room23_4m.png')

    addDoor(Door.new(0, 0, 350, 187,'room12','walk_sand.ogg'))
    addDoor(Door.new(210, 261, 350, 350,'room12','walk_sand.ogg'))
    addDoor(Door.new(0, 196, 65, 233,'room26','walk_computer.ogg'))

    addAmbience('waves.ogg')
  end


end