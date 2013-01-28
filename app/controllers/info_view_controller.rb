class InfoViewController < UIViewController

  def loadView
    self.view = UIView.alloc.initWithFrame( UIScreen.mainScreen.bounds )
    self.view.backgroundColor = UIColor.alloc.initWithPatternImage(UIImage.imageNamed("black_linen_v2.png"))
  end

  def viewDidLoad
    @light_gray = UIColor.colorWithRed(0.93, green: 0.93, blue: 0.93, alpha: 1)
    view.addSubview(buttonToGoBack)
    view.addSubview(addInstructions)
  end

  def buttonToGoBack
    close_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    close_button.setTitle("Back", forState:UIControlStateNormal)
    close_button.setTitleColor(UIColor.darkGrayColor, forState: UIControlStateNormal)
    close_button.frame = [[20, 20], [60, 40]]
    close_button.addTarget(self, action:"close", forControlEvents:UIControlEventTouchUpInside)
    close_button
  end

  def close
    self.view.removeFromSuperview
  end

  def addInstructions
    labelOpts = {
        :text            => "Stage 1: Picking the 3 man/woman. Roll one die until someone rolls a 3! \n\n" +
                            "Stage 2: Go around the circle rolling 2 dice and drinking. When it gets back to the 3 man, " +
                                      "click New Round to roll one die to pick a new 3 man starting at the player after the current 3 man.",
        :font            => UIFont.boldSystemFontOfSize(14),
        :textColor       => UIColor.whiteColor,
        :lineBreakMode   => UILineBreakModeWordWrap,
        :numberOfLines   => 0,
        :backgroundColor => UIColor.clearColor
    }

    label = UILabel.alloc.initWithFrame([[20, 80], [280, 300]])
    label.textAlignment = 0
    labelOpts.each { |k, v| label.send("#{k}=", v) }
    label
  end

end