class InfoView < UIView
  def initWithFrame(frame)
    super
    self.backgroundColor = UIColor.clearColor
    self
  end

  def drawRect(rect)
    drawInfo rect
  end
end