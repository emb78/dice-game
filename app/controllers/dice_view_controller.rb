class DiceViewController < UIViewController

  def loadView
    self.view = UIImageView.alloc.init
  end
  
  #--------------------
  
  def viewDidLoad
    @light_gray = UIColor.colorWithRed(0.93, green: 0.93, blue: 0.93, alpha: 1)
    @marroon = UIColor.colorWithRed(165/255.0, green: 15/255.0, blue: 56/255.0, alpha: 1)
    @game ||= Game.new
    @dice ||= Dice.new

    view.backgroundColor = UIColor.alloc.initWithPatternImage(UIImage.imageNamed("black_linen_v2.png"))

    @first_dice_view = makeDiceImage
    view.addSubview(@first_dice_view)

    @label = makeLabel
    view.addSubview(@label)

    @explanation = makeExplanationLabel
    view.addSubview(@explanation)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'rollDice')
    view.addGestureRecognizer(recognizer)

    if @game.in_round?
      @new_round_button ||= makeNewRoundButton
      view.addSubview @new_round_button
      @second_dice_view ||= makeSecondDiceImage
      view.addSubview(@second_dice_view)
    end
  end


  def shake_event
    puts "shake event"
    rollDice
  end

  #--------------------
  
  private
  
  def rollDice
    if @game.choosing_3_man?
      dice_roll = @dice.randomAnswer
      animateRoll(dice_roll, nil, @game.rolled3man(dice_roll))
      if dice_roll == 3
        @new_round_button ||= makeNewRoundButton
        view.addSubview @new_round_button
        @second_dice_view ||= makeSecondDiceImage
        view.addSubview(@second_dice_view)
      end
    elsif @game.in_round?
      first_dice_roll = @dice.randomAnswer
      second_dice_roll = @dice.randomAnswer
      animateRoll(first_dice_roll, second_dice_roll, @game.rolled(first_dice_roll, second_dice_roll))
    end
  end

  def animateRoll first_dice_roll, second_dice_roll, explanation_text
    UIView.animateWithDuration 0.5,
      animations: -> {
        @label.alpha = 0
        @label.transform = CGAffineTransformMakeScale(0.1, 0.1)
      },

      completion: ->(finished) {
        if !first_dice_roll.nil?
          @label.text = first_dice_roll.to_s
          changeDiceImage(@first_dice_view, first_dice_roll)
          if !second_dice_roll.nil?
            @label.text += " and #{second_dice_roll}"
            changeDiceImage(@second_dice_view, second_dice_roll)
          end
        else
          @label.text = "Roll the dice!"
        end

        @explanation.text = explanation_text

        UIView.animateWithDuration 1.0,
          animations: -> {
            @label.alpha = 1
            @label.transform = CGAffineTransformIdentity
          }
      }
  end

  def newRound
    animateRoll nil, nil, @game.restart
    @new_round_button.removeFromSuperview
    @second_dice_view.removeFromSuperview
  end

  #--------------------
  
  def makeLabel
    labelOpts = {
      :backgroundColor => @marroon,
      :text            => "Roll the dice!",
      :font            => UIFont.boldSystemFontOfSize(34),
      :textColor       => UIColor.whiteColor,
      :textAlignment   => UITextAlignmentCenter
    }

    label = UILabel.alloc.initWithFrame([[10, 10], [300, 80]])
    label.textAlignment = 0
    labelOpts.each { |k, v| label.send("#{k}=", v) }
    label
  end

  def makeExplanationLabel
    labelOpts = {
      :text            => "First person to roll a three is the 3 man!",
      :font            => UIFont.boldSystemFontOfSize(14),
      :textColor       => UIColor.darkGrayColor,
      :textAlignment   => UITextAlignmentCenter,
      :lineBreakMode   => UILineBreakModeWordWrap,
      :numberOfLines   => 0,
      :backgroundColor => @light_gray
    }

    label = UILabel.alloc.initWithFrame([[10, 350], [300, 100]])
    label.textAlignment = 0
    labelOpts.each { |k, v| label.send("#{k}=", v) }
    label
  end

  def makeNewRoundButton
    button ||= UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle "New Round", forState: UIControlStateNormal
    button.frame = [[210, 420], [100, 30]]
    button.addTarget(self, action: 'newRound', forControlEvents: UIControlEventTouchUpInside)

    button.setTitleColor(UIColor.darkGrayColor, forState: UIControlStateNormal)
    button.setBackgroundColor(@light_gray, forState:UIControlStateHighlighted)
    button.setBackgroundColor(@light_gray, forState:UIControlEventTouchUpInside)
    button
  end

  def makeDiceImage
    view = UIImageView.alloc.initWithImage(UIImage.imageNamed("3.png"))
    view.frame = [[10, 120], [150, 150]]
    view
  end

  def makeSecondDiceImage
    view = UIImageView.alloc.initWithImage(UIImage.imageNamed("3.png"))
    view.frame = [[170, 120], [150, 150]]
    view
  end

  def changeDiceImage(imageView, number)
    imageView.setImage(UIImage.imageNamed("#{number}.png"))
  end
end
