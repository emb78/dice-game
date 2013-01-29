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
    close_button = UIButton.buttonWithType(UIButtonTypeCustom)
    close_button.setTitle("Back", forState:UIControlStateNormal)
    close_button.titleLabel.font = UIFont.boldSystemFontOfSize(14)
    close_button.setBackgroundImage( UIImage.imageNamed("btnBack"), forState:UIControlStateNormal)
    close_button.frame = [[20, 20], [60, 40]]
    close_button.addTarget(self, action:"close", forControlEvents:UIControlEventTouchUpInside)
    close_button
  end

  def close
    self.view.removeFromSuperview
  end

  def addInstructions
    labelOpts = {
        :text            => "Stage 1: Pick the 3 man/woman by rolling one die until someone rolls a 3! \n\n" +
                            "Stage 2: Go clockwise around the circle rolling 2 dice and drinking according to the rules. When it gets back to the 3 man, " +
                                      "click New Round to go back to Stage 1 starting at the player after the current 3 man. \n\n" +
                            "Drinking Rules: The 3 man drinks every time a 3 is rolled or the two dice add up to 3. " +
                                      "The person to the right of the roller drinks when the dice add up to 7, " +
                                      "the roller drinks if the dice add up to 8 and the person to the left of the roller drinks when the dice add up to 9. " +
                                      "If doubles are rolled, the roller doles out an extra number of drinks equal to the number on one of the dice.",
        :font            => UIFont.boldSystemFontOfSize(13),
        :textColor       => UIColor.whiteColor,
        :lineBreakMode   => UILineBreakModeWordWrap,
        :numberOfLines   => 0,
        :backgroundColor => UIColor.clearColor
    }

    label = UILabel.alloc.initWithFrame([[20, 60], [280, 340]])
    label.textAlignment = 0
    labelOpts.each { |k, v| label.send("#{k}=", v) }
    label
  end

end