require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

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

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room6')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(281, 0, 350, 350)
                .destination('room8')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(132, 187, 201, 243)
                .destination('room20')
                .walkSound('walk_ladder.ogg'))

    addAmbience('wind.ogg')
  end


end