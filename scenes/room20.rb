require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Bottom of ladder

class Room20 < Scene

  def initialize
    super
    addBackgroundImage('room20/room20.png')

    addDoor(Door.new(0, 0, 63, 350,'room21','walk_sand.ogg'))
    addDoor(Door.new(281, 0, 350, 350,'room12','walk_sand.ogg'))
    addDoor(Door.new(129, 0, 215, 260,'room7','walk_ladder.ogg'))


    addAmbience('waves.ogg')
  end


end