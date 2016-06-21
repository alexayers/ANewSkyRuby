require_relative '../scenes/begin'
require_relative '../scenes/room1'
require_relative '../scenes/room2'
require_relative '../scenes/room3'
require_relative '../scenes/room4'
require_relative '../scenes/room5'
require_relative '../scenes/room6'
require_relative '../scenes/room7'
require_relative '../scenes/room8'
require_relative '../scenes/room9'
require_relative '../scenes/room10'
require_relative '../scenes/room12'
require_relative '../scenes/room13'
require_relative '../scenes/room14'
require_relative '../scenes/room15'
require_relative '../scenes/room16'
require_relative '../scenes/room17'
require_relative '../scenes/room18'
require_relative '../scenes/room19'
require_relative '../scenes/room20'
require_relative '../scenes/room21'
require_relative '../scenes/room23'
require_relative '../scenes/room24'
require_relative '../scenes/room25'
require_relative '../scenes/room26'
require_relative '../scenes/room27'
require_relative '../scenes/room29'
require_relative '../scenes/room30'
require_relative '../scenes/room31'
require_relative '../scenes/room32'
require_relative '../scenes/room33'
require_relative '../scenes/room34'

require_relative '../event/eventbus'
require 'gosu'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Collection of scenes

class SceneManager

  def initialize
    @currentScene = 'begin'
    @scenes = {}

    registerScene('begin', Begin.new)
    registerScene('room1', Room1.new)
    registerScene('room2', Room2.new)
    registerScene('room3', Room3.new)
    registerScene('room4', Room4.new)
    registerScene('room5', Room5.new)
    registerScene('room6', Room6.new)
    registerScene('room7', Room7.new)
    registerScene('room8', Room8.new)
    registerScene('room9', Room9.new)
    registerScene('room10', Room10.new)
    registerScene('room12', Room12.new)
    registerScene('room13', Room13.new)
    registerScene('room14', Room14.new)
    registerScene('room15', Room15.new)
    registerScene('room16', Room16.new)
    registerScene('room17', Room17.new)
    registerScene('room18', Room18.new)
    registerScene('room19', Room19.new)
    registerScene('room20', Room20.new)
    registerScene('room21', Room21.new)
    registerScene('room23', Room23.new)
    registerScene('room24', Room24.new)
    registerScene('room25', Room25.new)
    registerScene('room26', Room26.new)
    registerScene('room27', Room27.new)
    registerScene('room29', Room29.new)
    registerScene('room30', Room30.new)
    registerScene('room31', Room31.new)
    registerScene('room32', Room32.new)
    registerScene('room33', Room33.new)
    registerScene('room34', Room34.new)

    EventBus.instance.registerListener('sceneManager', self)
    @scenes[@currentScene].playAmbience
  end

  def registerScene(sceneName, scene)
    @scenes[sceneName] = scene
    EventBus.instance.registerListener(sceneName, scene)
  end

  def render
    @scenes[@currentScene].render
  end

  def processClick(mousePosition)
    @scenes[@currentScene].processClick(mousePosition['mouseX'], mousePosition['mouseY'])
  end


  def processEvent(event)

    #No need to stop and start ambience if using same ambient sound between scenes
    if @scenes[@currentScene].ambienceName != @scenes[event.payload].ambienceName
      @scenes[@currentScene].stopAmbience
      @scenes[event.payload].playAmbience
    end

    @currentScene = event.payload

  end


end