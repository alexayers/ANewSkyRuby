require_relative '../scene'
require_relative '../door'
require_relative '../inventory'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Grave

class Room14 < Scene

  def initialize
    super
    addBackgroundImage('room14/room14_1b.png')
    addMiddlegroundImage('room14/room14_1m.png')


    addDoor(Door.new(0, 0, 63, 350)
                .destination('room13')
                .walkSound('walk_sand.ogg')
    )

    addItem(Item.new(149, 234, 206, 312)
                .title('grave')
                .clickable
                .callback {
      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'shovel'
          Inventory.instance.dropSelected
          clearMiddleground
          addMiddlegroundImage('room14/room14_1mb.png')
          AudioManager.instance.play('dig.ogg')

          _purpleCrystal = Item.new(nil, nil, nil, nil)
                               .filename('purple_crystal.png')
                               .title('purple_crystal')
          Inventory.instance.addToInventory(_purpleCrystal)
        end
      end


    })

    addAmbience('waves.ogg')

  end


end