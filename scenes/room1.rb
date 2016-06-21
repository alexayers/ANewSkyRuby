require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Broken light room

class Room1 < Scene

  def initialize
    super
    addBackgroundImage('room1/room1_1b.png')

    addForegroundImage('room1/room1_1f.png')
    addForegroundImage('room1/room1_2f.png')
    addForegroundImage('room1/room1_3f.png')
    addAmbience('bad_light.ogg')

    addDoor(Door.new(0, 0, 42, 348)
                .destination('room2')
                .walkSound('walk_building.ogg')
    )

    addDoor(Door.new(77, 142, 161, 269)
                .destination('room4')
                .walkSound('walk_building.ogg')
                .lockDoor
                .title('broken_door')
    )

    addItem(Item.new(116, 280, 148, 312)
                .title('key')
                .filename('key.png')
                .grabable
                .clickSound('pickup_keys.ogg')
                .onScreen
    )

    addItem(Item.new(167, 200, 185, 223)
                .title('broken_cardreader')
                .clickable
                .value('broken')
                .callback {
      if Inventory.instance.selectedItem != nil
        if ItemManager.instance.getItem('broken_cardreader').getValue == 'broken' && Inventory.instance.selectedItem.getTitle == 'hammer'
          ItemManager.instance.getItem('broken_cardreader').value('fixed')
          Inventory.instance.dropSelected
          clearBackground
          addBackgroundImage('room1/room1_1bb.png')
          EventBus.instance.publishEvent(Event.new('broken_door', 'unlock'))
          AudioManager.instance.play('break_door.ogg')
        end

      else
        AudioManager.instance.play('bad_code.ogg')
      end


    })


  end


end