require 'singleton'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Singleton for managing audio resources

class AudioManager
  include Singleton

  def initialize
    @sounds = {}

    loadAudio('bad_code.ogg')
    loadAudio('bad_light.ogg')
    loadAudio('badlanding.ogg')
    loadAudio('begin.ogg')
    loadAudio('break_door.ogg')
    loadAudio('broken_cardreader.ogg')
    loadAudio('cave.ogg')
    loadAudio('computer_type.ogg')
    loadAudio('dig.ogg')
    loadAudio('empty_supply.ogg')
    loadAudio('good_code.ogg')
    loadAudio('inventory_click.ogg')
    loadAudio('key_locked.ogg')
    loadAudio('locked_door.ogg')
    loadAudio('maproom.ogg')
    loadAudio('open_compartment.ogg')
    loadAudio('open_door.ogg')
    loadAudio('open_toolbox.ogg')
    loadAudio('pick_keycard.ogg')
    loadAudio('pickup_keys.ogg')
    loadAudio('pickup.ogg')
    loadAudio('remove_power.ogg')
    loadAudio('rocks.ogg')
    loadAudio('sail.ogg')
    loadAudio('slide_door.ogg')
    loadAudio('spaceship.ogg')
    loadAudio('touch_glass.ogg')
    loadAudio('unlock_door.ogg')
    loadAudio('walk_building.ogg')
    loadAudio('walk_computer.ogg')
    loadAudio('walk_ladder.ogg')
    loadAudio('walk_sand.ogg')
    loadAudio('waves.ogg')
    loadAudio('wind.ogg')

  end

  def loadAudio(filename)
    # @sounds[filename] = Gosu::Sample.new('resources/audio/' + filename)
    @sounds[filename] = Sound.new(filename)
  end

  def playLooped(filename)
    @sounds[filename].sampleInstance(@sounds[filename].getSample.play(1, 1, true))
  end

  def play(filename)
    begin
      @sounds[filename].getSample.play
    rescue
      puts 'Unable to find sound ' + filename
    end

  end

  def stop(filename)
    @sounds[filename].getSampleInstance.stop
  end


end

class Sound

  def initialize(filename)
    @sampleInstance = nil
    @sample = Gosu::Sample.new('resources/audio/' + filename)
  end

  def sampleInstance(sampleInstance)
    @sampleInstance = sampleInstance
    return self
  end

  def getSampleInstance
    return @sampleInstance
  end

  def getSample
    return @sample
  end

end
