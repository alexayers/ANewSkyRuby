require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Bed room

class Room2 < Scene

  def initialize
    super
    addBackgroundImage('room2/room2_1b.png')

    addAmbience('bad_light.ogg')

    addDoor(Door.new(298, 0, 350, 350,'room1','walk_building.ogg'))
    addDoor(Door.new(0, 121, 50, 333,'room3','walk_building.ogg')
    .key('key')
        .clickSound('key_locked.ogg')
    )
    addDoor(Door.new(154, 201, 242, 267,'room27','walk_building.ogg'))
  end


end