require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

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

    addDoor(Door.new(0, 0, 350, 187)
                .destination('room12')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(210, 261, 350, 350)
                .destination('room12')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(0, 196, 65, 233)
                .destination('room26')
                .walkSound('walk_computer.ogg')
    )

    addAmbience('waves.ogg')
  end


end