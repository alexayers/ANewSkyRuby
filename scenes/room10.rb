require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Red tree

class Room10 < Scene

  def initialize
    super
    addBackgroundImage('room10/room10_1b.png')
    addBackgroundImage('room10/room10_2b.png')
    addBackgroundImage('room10/room10_3b.png')

    addMiddlegroundImage('room10/room10_1m.png')
    addMiddlegroundImage('room10/room10_2m.png')
    addMiddlegroundImage('room10/room10_3m.png')


    addForegroundImage('room10/room10_1f.png')
    addForegroundImage('room10/room10_2f.png')
    addForegroundImage('room10/room10_3f.png')
    addForegroundImage('room10/room10_4f.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room9')
                .walkSound('walk_sand.ogg')
    )

    addItem(Item.new(219, 66, 297, 281)
                .clickable
                .title('parachute')
                .clickSound('sail.ogg')
                .callback {
      clearMiddleground
      addMiddlegroundImage('room10/room10_no_chute_m.png')
      _sail = Item.new(nil, nil, nil, nil)
                  .filename('parachute.png')
                  .title('parachute')
      Inventory.instance.addToInventory(_sail)
      ItemManager.instance.getItem('parachute')
          .makeUnclickable

    }
    )


    addAmbience('wind.ogg')

  end


end