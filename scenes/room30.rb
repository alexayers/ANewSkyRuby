require_relative '../scene'
require_relative '../door'
require_relative '../itemmanager'
require_relative '../event/event'
require_relative '../event/eventbus'
require_relative '../audioManager'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Map computer

class Room30 < Scene

  def initialize
    super


    @crossHair = Gosu::Image.new('resources/objects/crosshair.png', :retro => true)
    addBackgroundImage('room30/room30_1b.png')

    addMiddlegroundImage('room30/room30_1m.png')
    addMiddlegroundImage('room30/room30_2m.png')
    addMiddlegroundImage('room30/room30_3m.png')
    addMiddlegroundImage('room30/room30_4m.png')

    addDoor(Door.new(0, 0, 47, 296, 'room19', 'walk_computer.ogg'))
    addDoor(Door.new(291, 0, 350, 296, 'room19', 'walk_computer.ogg'))

    addItem(Item.new(nil, nil, nil, nil)
                .title('mapPad')
                .value('0,0')
    )

    addItem(Item.new(12, 305, 74, 339)
                .title('mapPadEnter')
                .value('')
                .clickable
                .callback {


      _coords = ItemManager.instance.getItem('mapPad').getValue.split(',')
      _CoordX = _coords[0].to_i
      _CoordY = _coords[1].to_i

      if _CoordX == 4 &&
          _CoordY == 3 &&
          ItemManager.instance.getItem('pink_pilar').getValue == 'fixed' &&
          ItemManager.instance.getItem('purple_pilar').getValue == 'fixed'

        ItemManager.instance.getItem('mapPadEnter').value('ready')

        EventBus.instance.publishEvent(Event.new('room25', 'ready'))
        clearBackground
        addBackgroundImage('room30/room30_1bd.png')
        AudioManager.instance.play('good_code.ogg')
      else
        ItemManager.instance.getItem('mapPadEnter').value('')
        AudioManager.instance.play('bad_code.ogg')
      end
    })

    clickCallBack { |x, y|
      _mapPadEnter = ItemManager.instance.getItem('mapPadEnter')

      if _mapPadEnter.getValue != 'ready'
        _coords = ItemManager.instance.getItem('mapPad').getValue.split(',')
        _CoordX = _coords[0].to_i
        _CoordY = _coords[1].to_i

        if x >= 110 && x <= 140 &&
            y >= 308 && y <= 337
          if _CoordY < 4
            _CoordY += 1
          end
        elsif x >= 162 && x <= 195 &&
            y >= 308 && y <= 337
          if _CoordY > 0
            _CoordY-= 1
          end
        elsif x >= 218 && x <= 250 &&
            y >= 308 && y <= 337
          if _CoordX > 0
            _CoordX-= 1
          end
        elsif x >= 271 && x <= 382 &&
            y >= 308 && y <= 337
          if _CoordX < 5
            _CoordX += 1
          end
        end

        value = _CoordX.to_s + ',' + _CoordY.to_s
        ItemManager.instance.getItem('mapPad').value(value)
        AudioManager.instance.play('good_code.ogg')
      else
        AudioManager.instance.play('bad_code.ogg')
      end
    }

    renderCallBack {
      _coords = ItemManager.instance.getItem('mapPad').getValue.split(',')
      _x = _coords[0].to_i
      _y = _coords[1].to_i

      _xOffset = 55
      _yOffset = 33

      (0 .. 5).each { |r|
        (0 .. 6).each { |c|
          if c == _x && r == _y
            @crossHair.draw(_xOffset, _yOffset, 0, 11, 11)
          end

          _xOffset += 44
        }

        _xOffset = 55
        _yOffset += 44
      }

    }

    addAmbience('maproom.ogg')
  end

  def processEvent(event)
    clearBackground
    addBackgroundImage('room30/room30_1bb.png')
    addBackgroundImage('room30/room30_1bc.png')
  end


end