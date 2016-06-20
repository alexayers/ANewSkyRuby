require_relative '../scene'
require_relative '../door'
require_relative '../inventory'
require_relative '../itemmanager'
require_relative '../event/event'
require_relative '../event/eventbus'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Sailboat GPS

class Room33 < Scene

  def initialize
    super
    addBackgroundImage('room33/room33_1b.png')
    addBackgroundImage('room33/room33_2b.png')
    addBackgroundImage('room33/room33_3b.png')

    addMiddlegroundImage('room33/room33_1m.png')


    addDoor(Door.new(0, 0, 23, 201)
                .destination('room21')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(322, 0, 350, 35)
                .destination('room21')
                .walkSound('walk_sand.ogg'))
    addDoor(Door.new(0, 307, 350, 350)
                .destination('room21')
                .walkSound('walk_sand.ogg'))


    addItem(Item.new(41, 239, 84, 302)
                .clickable
                .title('navStorage')
                .callback {

      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'gpsDevice'
          ItemManager.instance.getItem('navStorage').value('ready')
          Inventory.instance.dropSelected
          clearMiddleground
          addMiddlegroundImage('room33/room33_1mb.png')
          AudioManager.instance.play('good_code.ogg')
        end

      else
        AudioManager.instance.play('bad_code.ogg')
      end

    })

    addItem(Item.new(234, 22, 290, 257)
                .clickable
                .callback {
      _navStorage = ItemManager.instance.getItem('navStorage')
      _sailBoat = ItemManager.instance.getItem('sailboat')

      if _navStorage.getValue == 'ready' &&
          _sailBoat.getValue == 'ready'
        EventBus.instance.publishEvent(Event.new('sceneManager', 'room34'))
      end


    })


    addAmbience('waves.ogg')

  end


end