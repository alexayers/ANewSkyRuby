require_relative '../scene'
require_relative '../door'
require_relative '../event/event'
require_relative '../event/eventbus'
require_relative '../inventory'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Outside map room

class Room5 < Scene

  def initialize
    super
    addBackgroundImage('room5/room5_1b.png')
    addBackgroundImage('room5/room5_2b.png')
    addBackgroundImage('room5/room5_3b.png')

    addMiddlegroundImage('room5/room5_1m.png')
    addMiddlegroundImage('room5/room5_2m.png')

    addDoor(Door.new(154, 131, 247, 267, 'room18', 'slide_door.ogg', true)
                .title('slide_door')
    )
    addDoor(Door.new(306, 0, 350, 350, 'room4', 'walk_sand.ogg'))


    addItem(Item.new(270, 183, 302, 230)
                .title('keyreader')
                .clickable
                .callback {
      if Inventory.instance.selectedItem != nil
       if Inventory.instance.selectedItem.getTitle == 'keycard'
          Inventory.instance.dropSelected
          clearMiddleground
          addMiddlegroundImage('room5/room5_1mb.png')
          addMiddlegroundImage('room5/room5_2mb.png')

          EventBus.instance.publishEvent(Event.new('slide_door', 'unlock'))

          AudioManager.instance.play('slide_door.ogg')
        end
      end


    })


    addAmbience('wind.ogg')
  end


end