require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Cockpit computer

class Room26 < Scene

  def initialize
    super
    addBackgroundImage('room26/room26_1b.png')

    addDoor(Door.new(0, 0, 350, 181)
                .destination('room23')
                .walkSound('walk_computer.ogg')
    )


    addItem(Item.new(222, 120, 329, 164)
                .title('keypad_enter')
                .clickable
                .value('')
                .callback {

      if ItemManager.instance.getItem('keypad_enter').getValue == '7,3,2,9,6,'
        clearBackground
        addBackgroundImage('room26/room26_1bb.png')

        EventBus.instance.publishEvent(Event.new('energy_door', 'unlock'))
        EventBus.instance.publishEvent(Event.new('room12', 'unlock'))

        ItemManager.instance.getItem('keypad_enter').makeUnclickable
        AudioManager.instance.play('good_code.ogg')
        AudioManager.instance.play('open_compartment.ogg')
      else
        ItemManager.instance.getItem('keypad_enter').value('')
        AudioManager.instance.play('bad_code.ogg')
      end
    })

    @button1 = Gosu::Image.new('resources/objects/1.png', :retro => true)
    @button2 = Gosu::Image.new('resources/objects/2.png', :retro => true)
    @button3 = Gosu::Image.new('resources/objects/3.png', :retro => true)
    @button4 = Gosu::Image.new('resources/objects/4.png', :retro => true)
    @button5 = Gosu::Image.new('resources/objects/5.png', :retro => true)
    @button6 = Gosu::Image.new('resources/objects/6.png', :retro => true)
    @button7 = Gosu::Image.new('resources/objects/7.png', :retro => true)
    @button8 = Gosu::Image.new('resources/objects/8.png', :retro => true)
    @button9 = Gosu::Image.new('resources/objects/9.png', :retro => true)
    @button10 = Gosu::Image.new('resources/objects/10.png', :retro => true)

    renderCallBack {
      _keyCode = ItemManager.instance.getItem('keypad_enter').getValue.split(',')
      _offset = 5

      _keyCode.each { |key|

        case key
          when '1'
            @button1.draw(_offset, 35, 0, 11, 11)
          when '2'
            @button2.draw(_offset, 35, 0, 11, 11)
          when '3'
            @button3.draw(_offset, 35, 0, 11, 11)
          when '4'
            @button4.draw(_offset, 35, 0, 11, 11)
          when '5'
            @button5.draw(_offset, 35, 0, 11, 11)
          when '6'
            @button6.draw(_offset, 35, 0, 11, 11)
          when '7'
            @button7.draw(_offset, 35, 0, 11, 11)
          when '8'
            @button8.draw(_offset, 35, 0, 11, 11)
          when '9'
            @button9.draw(_offset, 35, 0, 11, 11)
          when '10'
            @button10.draw(_offset, 35, 0, 11, 11)
        end

        _offset += 65
      }

    }

    clickCallBack { |x, y|

      _keyCodeValue = ItemManager.instance.getItem('keypad_enter').getValue

      if _keyCodeValue.length < 10

        if x >= 23 && x <= 65 &&
            y >= 197 && y <= 261
          _keyCodeValue += '1,';
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 77 && x <= 130 &&
            y >= 197 && y <= 261
          _keyCodeValue += '2,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 141 && x <= 196 &&
            y >= 197 && y <= 261
          _keyCodeValue += '3,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 208 && x <= 262 &&
            y >= 197 && y <= 261
          _keyCodeValue += '4,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 273 && x <= 326 &&
            y >= 197 && y <= 261
          _keyCodeValue += '5,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 23 && x <= 65 &&
            y >= 273 && y <= 337
          _keyCodeValue += '6,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 77 && x <= 130 &&
            y >= 273 && y <= 337
          _keyCodeValue += '7,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 141 && x <= 196 &&
            y >= 273 && y <= 337
          _keyCodeValue += '8,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 208 && x <= 262 &&
            y >= 273 && y <= 337
          _keyCodeValue += '9,'
          AudioManager.instance.play('computer_type.ogg')
        elsif x >= 273 && x <= 326 &&
            y >= 273 && y <= 337
          _keyCodeValue += 'a,'
          AudioManager.instance.play('computer_type.ogg')
        end

        ItemManager.instance.getItem('keypad_enter').value(_keyCodeValue)
      end


    }


    addAmbience('spaceship.ogg')
  end


end