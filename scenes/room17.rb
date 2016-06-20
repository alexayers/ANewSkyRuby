require_relative '../scene'
require_relative '../door'
require_relative '../inventory'
require_relative '../itemmanager'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Pink Crystal room

class Room17 < Scene

  def initialize
    super
    addBackgroundImage('room17/room17_1b.png')
    addMiddlegroundImage('room17/room17_1m.png')
    addMiddlegroundImage('room17/room17_2m.png')
    addMiddlegroundImage('room17/room17_3m.png')
    addForegroundImage('room17/room17_1f.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room16')
                .walkSound('walk_sand.ogg')
    )


    addItem(Item.new(98, 78, 251, 175)
                .title('glass_compartment')
                .clickable
                .callback {
      if ItemManager.instance.getItem('generator').getValue == 'powered'
        clearForeground
        clearMiddleground

        _pinkCrystal = Item.new(nil, nil, nil, nil)
                           .filename('pink_crystal.png')
                           .title('pink_crystal')
        Inventory.instance.addToInventory(_pinkCrystal)
        ItemManager.instance.getItem('glass_compartment').makeUnclickable
        AudioManager.instance.play('open_compartment.ogg')
      else
        AudioManager.instance.play('touch_glass.ogg')
      end


    })

    addAmbience('cave.ogg')
  end


end