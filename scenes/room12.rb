require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Crash site

class Room12 < Scene

  def initialize
    super
    addBackgroundImage('room12/room12_1b.png')
    addBackgroundImage('room12/room12_2b.png')
    addBackgroundImage('room12/room12_3b.png')
    addBackgroundImage('room12/room12_4b.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room20')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(315, 0, 350, 350)
                .destination('room13')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(235, 154, 294, 195)
                .destination('room29')
                .walkSound('walk_sand.ogg')
                .lockDoor
                .title('energy_door')
    )

    addDoor(Door.new(105, 165, 211, 261)
                .destination('room23')
                .walkSound('walk_sand.ogg')
    )

    addAmbience('waves.ogg')
  end

  def processEvent(event)

    clearBackground
    addBackgroundImage('room12/room12_1bb.png')
    addBackgroundImage('room12/room12_2bb.png')
    addBackgroundImage('room12/room12_3bb.png')
    addBackgroundImage('room12/room12_4bb.png')


  end

end