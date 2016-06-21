require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Bottom of ladder

class Room20 < Scene

  def initialize
    super
    addBackgroundImage('room20/room20.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room21')
                .walkSound('walk_sand.ogg')
    )

    addDoor(Door.new(281, 0, 350, 350)
                .destination('room12')
                .walkSound('walk_sand.ogg')
    )

    addDoor(Door.new(129, 0, 215, 260)
                .destination('room7')
                .walkSound('walk_ladder.ogg')
    )


    addAmbience('waves.ogg')
  end


end