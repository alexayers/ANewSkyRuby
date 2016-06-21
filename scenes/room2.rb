require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Bed room

class Room2 < Scene

  def initialize
    super
    addBackgroundImage('room2/room2_1b.png')

    addAmbience('bad_light.ogg')

    addDoor(Door.new(298, 0, 350, 350)
                .destination('room1')
                .walkSound('walk_building.ogg')
    )

    addDoor(Door.new(0, 121, 50, 333)
                .destination('room3')
                .walkSound('walk_building.ogg')
                .key('key')
                .clickSound('key_locked.ogg')
    )
    addDoor(Door.new(154, 201, 242, 267)
                .destination('room27')
                .walkSound('walk_building.ogg'))
  end


end