require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'
# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Spaceship power

class Room29 < Scene

  def initialize
    super
    addBackgroundImage('room29/room29_1b.png')
    addMiddlegroundImage('room29/room29_1m.png')

    addDoor(Door.new(0, 0, 337, 121)
                .destination('room12')
                .walkSound('walk_sand.ogg')
    )

    addItem(Item.new(46, 140, 331, 314)
                .clickable
                .title('trunk')
                .clickSound('remove_power.ogg')
                .callback {
      clearMiddleground
      _powercell = Item.new(nil, nil, nil, nil)
                       .filename('power_cell.png')
                       .title('power_cell')

      Inventory.instance.addToInventory(_powercell)
      ItemManager.instance.getItem('trunk')
          .makeUnclickable

    })

    addAmbience('spaceship.ogg')
  end


end