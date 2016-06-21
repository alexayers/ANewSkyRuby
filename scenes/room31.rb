require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Toolbox

class Room31 < Scene

  def initialize
    super
    addBackgroundImage('room31/room31_1b.png')


    addDoor(Door.new(0, 0, 350, 130)
                .destination('room3')
                .walkSound('open_toolbox.ogg')
    )
    addDoor(Door.new(0, 239, 350, 350)
                .destination('room3')
                .walkSound('open_toolbox.ogg')
    )

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