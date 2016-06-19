require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Weird plants

class Room8 < Scene

  def initialize
    super
    addBackgroundImage('room8/room8_1b.png')
    addBackgroundImage('room8/room8_2b.png')
    addBackgroundImage('room8/room8_3b.png')

    addMiddlegroundImage('room8/room8_1m.png')
    addMiddlegroundImage('room8/room8_2m.png')
    addMiddlegroundImage('room8/room8_3m.png')
    addMiddlegroundImage('room8/room8_4m.png')

    addDoor(Door.new(0, 0, 63, 350,'room7','walk_sand.ogg'))
    addDoor(Door.new(281, 0, 350, 350,'room9','walk_sand.ogg'))

    addAmbience('wind.ogg')

  end


end