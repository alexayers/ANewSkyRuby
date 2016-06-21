require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'
# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Sailboat

class Room21 < Scene

  def initialize
    super
    addBackgroundImage('room21/room21_1b.png')

    addMiddlegroundImage('room21/room21_1m.png')
    addMiddlegroundImage('room21/room21_2m.png')
    addMiddlegroundImage('room21/room21_3m.png')
    addMiddlegroundImage('room21/room21_4m.png')

    addForegroundImage('room21/room21_1f.png')
    addForegroundImage('room21/room21_2f.png')
    addForegroundImage('room21/room21_3f.png')
    addForegroundImage('room21/room21_2f.png')

    addDoor(Door.new(297, 0, 350, 350)
                .destination('room20')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(250, 152, 288, 219)
                .destination('room33')
                .walkSound('walk_sand.ogg')
    )

    addItem(Item.new(98, 61, 226, 279)
                .clickable
                .title('sailboat')
                .callback {

      if Inventory.instance.isSelectedItem('parachute')
        Inventory.instance.dropSelected
        ItemManager.instance.getItem('sailboat').value('ready')

        clearForeground
        addForegroundImage('room21/room21_1fb.png')
        addForegroundImage('room21/room21_2fb.png')
        addForegroundImage('room21/room21_3fb.png')
        addForegroundImage('room21/room21_2fb.png')
        AudioManager.instance.play('sail.ogg')
      end

    }
    )

    addAmbience('waves.ogg')

  end


end