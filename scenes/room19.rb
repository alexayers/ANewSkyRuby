require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Map room computers

class Room19 < Scene

  def initialize
    super
    addBackgroundImage('room19/room19_1b.png')
    addBackgroundImage('room19/room19_2b.png')
    addBackgroundImage('room19/room19_3b.png')


    addMiddlegroundImage('room19/room19_1m.png')
    addMiddlegroundImage('room19/room19_2m.png')
    addMiddlegroundImage('room19/room19_3m.png')
    addMiddlegroundImage('room19/room19_4m.png')
    addMiddlegroundImage('room19/room19_5m.png')
    addMiddlegroundImage('room19/room19_6m.png')

    addDoor(Door.new(0, 0, 46, 350)
                .destination('room18')
                .walkSound('walk_building.ogg')
    )
    addDoor(Door.new(109, 154, 163, 207)
                .destination('room25')
                .walkSound('walk_computer.ogg')
    )
    addDoor(Door.new(185, 221, 254, 257)
                .destination('room30')
                .walkSound('walk_computer.ogg')
    )

    addAmbience('maproom.ogg')

  end


end