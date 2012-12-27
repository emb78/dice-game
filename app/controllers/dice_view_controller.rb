class DiceViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end
  
  #--------------------
  
  def viewDidLoad
    @game ||= Game.new
    view.image = UIImage.imageNamed('background.png')

    @label = makeLabel
    view.addSubview(@label)

    @explanation = makeExplanationLabel
    view.addSubview(@explanation)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'rollDice')
    view.addGestureRecognizer(recognizer)

    @dice ||= Dice.new

    if @game.in_round?
      addNewRoundButton
    end
  end

  #--------------------
  
  private
  
  def rollDice
    if @game.choosing_3_man?
      dice_roll = @dice.randomAnswer
      animateRoll(dice_roll, nil, @game.rolled3man(dice_roll))
      if dice_roll == 3
        addNewRoundButton
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
        unless first_dice_roll.nil?
          @label.text = first_dice_roll.to_s
          @label.text += " and #{second_dice_roll}" unless second_dice_roll.nil?
        else
          @label.text = 'Roll the dice!'
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
  end

  #--------------------
  
  def makeLabel
    labelOpts = {
      :backgroundColor => UIColor.lightGrayColor,
      :text            => "Roll the dice!",
      :font            => UIFont.boldSystemFontOfSize(34),
      :textColor       => UIColor.darkGrayColor,
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
      :numberOfLines   => 0
    }

    label = UILabel.alloc.initWithFrame([[10, 350], [300, 80]])
    label.textAlignment = 0
    labelOpts.each { |k, v| label.send("#{k}=", v) }
    label
  end

  def addNewRoundButton
    @new_round_button ||= UIButton.buttonWithType UIButtonTypeRoundedRect
    @new_round_button.setTitle "New Round", forState: UIControlStateNormal
    @new_round_button.frame = [[210, 420], [100, 30]]
    @new_round_button.addTarget(self, action: 'newRound', forControlEvents: UIControlEventTouchUpInside)

    @new_round_button.setTitleColor(UIColor.darkGrayColor, forState: UIControlStateNormal)
    @new_round_button.setBackgroundColor(UIColor.whiteColor, forState:UIControlStateHighlighted)
    @new_round_button.setBackgroundColor(UIColor.whiteColor, forState:UIControlEventTouchUpInside)
    view.addSubview @new_round_button
  end
end
