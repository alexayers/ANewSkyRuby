require_relative '../scene'
require_relative '../door'

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


    addDoor(Door.new(0,0,350,350,'room1', nil))


  end



end