require_relative '../scene'
require_relative '../door'
require_relative '../itemmanager'
require_relative '../inventory'
require_relative '../audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Map Room GPS computer

class Room25 < Scene

  def initialize
    super

    addBackgroundImage('room25/room25_1b.png')
    addBackgroundImage('room25/room25_2b.png')
    addBackgroundImage('room25/room25_3b.png')
    addBackgroundImage('room25/room25_4b.png')

    addDoor(Door.new(0, 0, 47, 253)
                .destination('room19')
                .walkSound('walk_building.ogg')
    )
    addDoor(Door.new(291, 0, 350, 249)
                .destination('room19')
                .walkSound('walk_building.ogg')
    )

    addItem(Item.new(53, 219, 106, 252)
                .clickable
                .callback {
      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'storage_device'
          clearBackground
          addBackgroundImage('room25/room25_1bb.png')
          addBackgroundImage('room25/room25_2bb.png')
          addBackgroundImage('room25/room25_3bb.png')
          addBackgroundImage('room25/room25_4bb.png')

          addMiddlegroundImage('room25/room25_1m.png')

          _mapPadEnter = ItemManager.instance.getItem('mapPadEnter')

          if _mapPadEnter.getValue == 'ready'
            addForegroundImage('room25/room25_1f_map.png')
          else
            addForegroundImage('room25/room25_1f.png')
          end

          Inventory.instance.dropSelected

        end
      end
    })


    addItem(Item.new(240, 271, 304, 306)
                .clickable
                .title('mapload_enter')
                .callback {
      _mapPadEnter = ItemManager.instance.getItem('mapPadEnter')

      if _mapPadEnter.getValue == 'ready'

        _storageDevice = Item.new(nil, nil, nil, nil)
                             .value('gps_loaded')
                             .title('gpsDevice')
                             .filename('storage.png')

        clearMiddleground
        clearForeground
        addForegroundImage('room25/room25_1f_storage.png')
        ItemManager.instance.getItem('mapload_enter')
            .makeUnclickable

        Inventory.instance.addToInventory(_storageDevice)
        AudioManager.instance.play('good_code.ogg')
      else
        AudioManager.instance.play('bad_code.ogg')
      end

    })

    addAmbience('maproom.ogg')
  end

  def processEvent(event)

    addForegroundImage('room25/room25_1f_map.png')


  end

end