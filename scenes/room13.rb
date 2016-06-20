require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Outside cave

class Room13 < Scene

  def initialize
    super
    addBackgroundImage('room13/room13_1b.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room12')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(283, 0, 350, 350)
                .destination('room14')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(114, 88, 265, 257)
                .destination('room15')
                .walkSound('walk_sand.ogg')
    )

    addAmbience('waves.ogg')
  end


end