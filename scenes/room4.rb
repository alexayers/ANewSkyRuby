require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Outside prison

class Room4 < Scene

  def initialize
    super
    addBackgroundImage('room4/room4_1b.png')
    addBackgroundImage('room4/room4_2b.png')
    addBackgroundImage('room4/room4_3b.png')

    addMiddlegroundImage('room4/room4_1m.png')
    addMiddlegroundImage('room4/room4_2m.png')
    addMiddlegroundImage('room4/room4_3m.png')

    addForegroundImage('room4/room4_1f.png')
    addForegroundImage('room4/room4_2f.png')
    addForegroundImage('room4/room4_3f.png')

    addDoor(Door.new(0, 0, 44, 350)
                .destination('room5')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(289, 0, 350, 350)
                .destination('room6')
                .walkSound('walk_sand.ogg')
    )

    addDoor(Door.new(77, 140, 157, 265)
                .destination('room1')
                .walkSound('walk_sand.ogg')
    )


    addItem(Item.new(87, 295, 120, 317)
                .clickable
                .clickSound('pickup.ogg')
                .title('floor_keycard')
                .callback {
      clearForeground
      addForegroundImage('room4/room4_1fb.png')
      addForegroundImage('room4/room4_2fb.png')
      addForegroundImage('room4/room4_3fb.png')


      _keycard = Item.new(nil, nil, nil, nil)
                     .filename('keycard.png')
                     .title('keycard')
      Inventory.instance.addToInventory(_keycard)
      ItemManager.instance.getItem('floor_keycard')
          .makeUnclickable

    }
    )

    addAmbience('wind.ogg')
  end


end