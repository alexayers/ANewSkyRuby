require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Distant crash

class Room6 < Scene

  def initialize
    super
    addBackgroundImage('room6/room6_1b.png')
    addBackgroundImage('room6/room6_2b.png')
    addBackgroundImage('room6/room6_3b.png')

    addMiddlegroundImage('room6/room6_1m.png')
    addMiddlegroundImage('room6/room6_2m.png')
    addMiddlegroundImage('room6/room6_3m.png')
    addMiddlegroundImage('room6/room6_4m.png')
    addMiddlegroundImage('room6/room6_5m.png')


    addDoor(Door.new(0, 0, 63, 350)
                .destination('room4')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(281, 0, 350, 350)
                .destination('room7')
                .walkSound('walk_sand.ogg'))

    addAmbience('wind.ogg')

  end


end