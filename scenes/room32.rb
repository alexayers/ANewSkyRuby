require_relative '../scene'
require_relative '../door'
require_relative '../inventory'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Cave computer screen

class Room32 < Scene

  def initialize
    super
    addBackgroundImage('room32/room32_1b.png')


    addForegroundImage('room32/room32_1f.png')

    addDoor(Door.new(0, 0, 41, 240, 'room24', 'walk_computer.ogg'))
    addDoor(Door.new(270, 0, 350, 230, 'room24', 'walk_computer.ogg'))

    addItem(Item.new(249, 247, 320, 284)
                .clickable
                .title('release_storage')
                .callback {
      clearBackground
      addBackgroundImage('room32/room32_1bb.png')
      ItemManager.instance.getItem('empty_storage')
          .clickable

    })

    addItem(Item.new(72, 188, 115, 246)
                .title('empty_storage')
                .callback {
      clearForeground
      _storageDevice = Item.new(nil, nil, nil, nil)
                           .filename('storage.png')
                           .title('storage_device')
                           .value('empty')
      Inventory.instance.addToInventory(_storageDevice)

    })

    addAmbience('cave.ogg')
  end


end