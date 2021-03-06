require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Map room entrance

class Room18 < Scene

  def initialize
    super
    addBackgroundImage('room18/room18_1b.png')

    addMiddlegroundImage('room18/room18_1m.png')
    addMiddlegroundImage('room18/room18_2m.png')
    addMiddlegroundImage('room18/room18_3m.png')
    addMiddlegroundImage('room18/room18_4m.png')

    addForegroundImage('room18/room18_1f.png')

    addDoor(Door.new(286, 0, 350, 350)
                .destination('room19')
                .walkSound('walk_building.ogg')
    )
    addDoor(Door.new(131, 142, 248, 267)
                .destination('room5')
                .walkSound('slide_door.ogg')
    )


    addItem(Item.new(90, 183, 118, 269)
                .clickable
                .title('room_shovel')
                .clickSound('pickup.ogg')
                .callback {
      clearForeground
      addForegroundImage('room18/nothing.png')
      _shovel = Item.new(nil, nil, nil, nil)
                    .filename('shovel.png')
                    .title('shovel')
      Inventory.instance.addToInventory(_shovel)
      ItemManager.instance.getItem('room_shovel')
          .makeUnclickable

    }
    )

    addAmbience('maproom.ogg')
  end


end