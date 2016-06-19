require_relative '../scene'
require_relative '../door'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Inside cave

class Room15 < Scene

  def initialize
    super
    addBackgroundImage('room15/room15_1b.png')
    addBackgroundImage('room15/room15_2b.png')
    addBackgroundImage('room15/room15_3b.png')
    addBackgroundImage('room15/room15_4b.png')

    addForegroundImage('room15/room15_1f.png')


    addDoor(Door.new(0, 0, 63, 350,'room24','walk_sand.ogg'))
    addDoor(Door.new(315, 0, 350, 350,'room16','walk_sand.ogg'))
    addDoor(Door.new(84, 98, 267, 258,'room13','walk_sand.ogg'))


    addAmbience('cave.ogg')
  end


end