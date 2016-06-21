require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Generator

class Room16 < Scene

  def initialize
    super
    addBackgroundImage('room16/room16_1b.png')


    addMiddlegroundImage('room16/room16_1m.png')
    addMiddlegroundImage('room16/room16_2m.png')
    addMiddlegroundImage('room16/room16_3m.png')
    addMiddlegroundImage('room16/room16_4m.png')
    addMiddlegroundImage('room16/room16_5m.png')
    addMiddlegroundImage('room16/room16_6m.png')

    addForegroundImage('room16/room16_1f.png')

    addDoor(Door.new(0, 0, 63, 350)
                .destination('room15')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(315, 0, 350, 350)
                .destination('room17')
                .walkSound('walk_sand.ogg')
    )

    addItem(Item.new(141, 164, 204, 206)
                .title('generator')
                .clickable
                .value('not_powered')
                .callback {
      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'power_cell'
          ItemManager.instance.getItem('generator').value('powered')
          Inventory.instance.dropSelected
          ItemManager.instance.getItem('generator').makeUnclickable

          clearForeground
          addForegroundImage('room16/room16_1fb.png')

          EventBus.instance.publishEvent(Event.new('room24', 'power'))
          EventBus.instance.publishEvent(Event.new('room17', 'power'))

          EventBus.instance.publishEvent(Event.new('broken_door', 'unlock'))

          AudioManager.instance.play('remove_power.ogg')
        end

      else
        AudioManager.instance.play('empty_supply.ogg')
      end


    })

    addAmbience('cave.ogg')
  end


end