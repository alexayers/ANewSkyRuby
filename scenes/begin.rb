require_relative 'scene'
require_relative '../clickable/door'
require_relative '../clickable/item'
require_relative '../containers/inventory'
require_relative '../event/eventbus'
require_relative '../event/event'
require_relative '../managers/audiomanager'

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Splash Screen

class Begin < Scene

  def initialize
    super
    addBackgroundImage('begin/begin1.png')
    addBackgroundImage('begin/begin2.png')
    addBackgroundImage('begin/begin3.png')
    addAmbience('begin.ogg')


    addDoor(Door.new(0, 0, 350, 350)
                .destination('room1')
                .clickSound(nil)
    )


  end


end