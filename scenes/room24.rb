require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Cave Computer

class Room24 < Scene

  def initialize
    super
    addBackgroundImage('room24/room24_1b.png')
    addDoor(Door.new(315, 0, 350, 350)
                .destination('room15')
                .walkSound('walk_sand.ogg')
    )
    addAmbience('cave.ogg')

  end

  def processEvent(event)
    clearBackground
    addBackgroundImage('room24/room24_1bb.png')

    addDoor(Door.new(134, 89, 234, 168)
                .destination('room32')
                .walkSound('walk_computer.ogg')
    )

  end

end