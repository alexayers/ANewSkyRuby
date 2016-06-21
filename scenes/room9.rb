require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audioManager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Stone Pillars

class Room9 < Scene

  def initialize
    super
    addBackgroundImage('room9/room9_1b.png')
    addBackgroundImage('room9/room9_2b.png')
    addBackgroundImage('room9/room9_3b.png')


    addMiddlegroundImage('room9/room9_1m.png')


    addDoor(Door.new(0, 0, 63, 350)
                .destination('room8')
                .walkSound('walk_sand.ogg')
    )
    addDoor(Door.new(281, 0, 350, 350)
                .destination('room10')
                .walkSound('walk_sand.ogg'))


    addItem(Item.new(132, 131, 184, 177)
                .title('purple_pilar')
                .clickable
                .clickSound('rocks.ogg')
                .value('')
                .callback {
      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'purple_crystal'
          ItemManager.instance.getItem('purple_pilar').value('fixed')
          Inventory.instance.dropSelected

          if ItemManager.instance.getItem('pink_pilar').getValue == 'fixed'
            clearMiddleground
            addMiddlegroundImage('room9/room9_1m_all.png')
            addMiddlegroundImage('room9/room9_2m_all.png')
            addMiddlegroundImage('room9/room9_3m_all.png')
            EventBus.instance.publishEvent(Event.new('room30', 'updateMap'))
          else
            clearMiddleground
            addMiddlegroundImage('room9/room9_1m_purple.png')
          end
        end
      end
    })

    addItem(Item.new(197, 65, 247, 140)
                .title('pink_pilar')
                .clickable
                .clickSound('rocks.ogg')
                .value('')
                .callback {
      if Inventory.instance.selectedItem != nil
        if Inventory.instance.selectedItem.getTitle == 'pink_crystal'
          ItemManager.instance.getItem('pink_pilar').value('fixed')
          Inventory.instance.dropSelected

          if ItemManager.instance.getItem('purple_pilar').getValue == 'fixed'
            clearMiddleground
            addMiddlegroundImage('room9/room9_1m_all.png')
            addMiddlegroundImage('room9/room9_2m_all.png')
            addMiddlegroundImage('room9/room9_3m_all.png')
            EventBus.instance.publishEvent(Event.new('room30', 'updateMap'))
          else
            clearMiddleground
            addMiddlegroundImage('room9/room9_1m_pink.png')
          end
        end
      end
    })

    addAmbience('wind.ogg')

  end


end