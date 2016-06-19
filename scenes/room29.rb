require_relative '../scene'
require_relative '../door'
require_relative '../itemmanager'
require_relative '../inventory'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Spaceship power

class Room29 < Scene

  def initialize
    super
    addBackgroundImage('room29/room29_1b.png')
    addMiddlegroundImage('room29/room29_1m.png')

    addDoor(Door.new(0, 0, 337, 121, 'room12', 'walk_sand.ogg'))

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