
# @author Alex Ayers <ayers.alex@gmail.com>
# 6/19/2016
# Animated sprite container

class AnimatedFrame

  def initialize
    @currentFrame = 0
    @frameRate = 16
    @tick = 0
    @frames = Array.new
  end

  def addImage(filename)

    @frames.push(Gosu::Image.new(filename, :retro => true))

  end

  def size
    return @frames.length
  end

  def render

    @frames[@currentFrame].draw(0, 0, 0, 11, 11)

    @tick += 1

    if @tick == @frameRate
      @tick = 0
      @currentFrame += 1
    end

    if @currentFrame == @frames.length
      @currentFrame = 0
    end


  end
end

