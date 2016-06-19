require_relative '../scene'
require_relative '../door'
require_relative '../item'
require_relative '../inventory'
require_relative '../itemmanager'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Toolbox

class Room31 < Scene

  def initialize
    super
    addBackgroundImage('room31/room31_1b.png')


    addDoor(Door.new(0, 0, 350, 130, 'room3', 'open_toolbox.ogg'))
    addDoor(Door.new(0, 239, 350, 350, 'room3', 'open_toolbox.ogg'))
    addAmbience('bad_light.ogg')

    addItem(Item.new(128, 164, 294, 230)
                .clickable
                .clickSound('pickup.ogg')
                .title('toolbox')
                .callback {
      clearBackground
      addBackgroundImage('room31/room31_1bb.png')
      _hammer = Item.new(nil, nil, nil, nil)
                    .filename('hammer.png')
                    .title('hammer')
      Inventory.instance.addToInventory(_hammer)
      ItemManager.instance.getItem('toolbox')
          .makeUnclickable

    })

  end


end