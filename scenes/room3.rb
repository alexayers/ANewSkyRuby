require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Storage closet

class Room3 < Scene

  def initialize
    super
    addBackgroundImage('room3/room3_1b.png')
    addAmbience('bad_light.ogg')

    addDoor(Door.new(295, 119, 350, 333)
                .destination('room2')
                .walkSound('walk_building.ogg')
                .clickSound('unlock_door.ogg'))
    addDoor(Door.new(158, 102, 233, 138)
                .destination('room31')
                .walkSound('walk_building.ogg')
                .clickSound('open_toolbox.ogg'))
  end


end