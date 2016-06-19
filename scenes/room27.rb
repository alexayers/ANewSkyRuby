require_relative '../scene'
require_relative '../door'
require_relative '../inventory'
require_relative '../itemmanager'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Bed

class Room27 < Scene

  def initialize
    super
    addBackgroundImage('room27/room27_1b.png')

    addDoor(Door.new(0, 0, 350, 145,'room2','walk_building.ogg'))
    addDoor(Door.new(0, 237, 350, 350,'room2','walk_building.ogg'))

    addItem(Item.new(66, 180, 140, 215)
                .title('bed_photo')
                .clickable
                .clickSound('pickup.ogg')
                .callback {
      clearBackground
      addBackgroundImage('room27/room27_1bb.png')

      _photo = Item.new(nil, nil, nil, nil)
                    .filename('photo.png')
                    .title('photo')

      Inventory.instance.addToInventory(_photo)
      ItemManager.instance.getItem('bed_photo')
      .makeUnclickable
    })

    addAmbience('bad_light.ogg')

  end


end