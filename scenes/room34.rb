require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Credits

class Room34 < Scene

  def initialize
    super
    addBackgroundImage('room34/ending_3.png')
    addDoor(Door.new(77, 142, 161, 269)
                .destination('room21')
                .walkSound('walk_sand.ogg')
    )

    addAmbience('waves.ogg')
  end


end