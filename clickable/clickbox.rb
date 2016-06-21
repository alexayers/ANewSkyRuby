

# @author Alex Ayers <ayers.alex@gmail.com>
# 6/20/2016
# Base class for clickable screen objects

class ClickBox

  def initialize(lx,ly,hx,hy)
    @lx = lx
    @ly = ly
    @hx = hx
    @hy = hy
    @title = ''
    @clickSound = nil
    return self
  end

  def clickSound(filename)
    @clickSound = filename
    return self
  end

  def title(title)
    @title = title
    return self
  end

  def getTitle
    return @title
  end

end