require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

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

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room7')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(281, 0, 350, 350)
                .destination('room9')
                .walkSound('walk_sand.ogg'))

    addAmbience('wind.ogg')

  end


end