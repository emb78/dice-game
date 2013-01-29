class Game
  def initialize
    @threeman = 0
    @stage = 1
  end

  def choosing_3_man?
    @stage == 1
  end

  def in_round?
    @stage == 2
  end

  def restart
    @stage = 1
    return "First person to roll a three is the new 3 man! Tap or shake to roll."
  end

  def rolled3man dice1
    if dice1 == 3
      explanation_text = 'You are the new 3 man! Pass to the next person to begin stage 2.'
      advance_game
    else
      explanation_text = "Who will be the next 3 man? Phew! It's not you. Pass and keep rolling!"
    end
    return explanation_text
  end

  def rolled dice1, dice2
    explanation_text = ''

    if @stage == 2
      # assign drinks
      if dice1 == 3 and dice2 == 3
        explanation_text = '3 man drinks twice! Roll again.'
      elsif dice1 + dice2 == 3
        explanation_text = '3 man drinks! Roll again.'
      elsif dice1 == 3 or dice2 == 3
        explanation_text = '3 man drinks! '
      elsif dice1 == dice2
        explanation_text += "You rolled doubles! Dole out #{dice1} drinks to any person/people of your choosing. "
      end

      if dice1 + dice2 == 7
        explanation_text += 'Person to your right drinks! Roll again.'
      elsif dice1 + dice2 == 8
        explanation_text += 'You drink! Roll again. '
      elsif dice1 + dice2 == 9
        explanation_text += 'Person to your left drinks! Roll again. '
      end

      if explanation_text == '3 man drinks! '
        explanation_text += 'Roll again.'
      end
      if explanation_text.empty?
        explanation_text = 'Nobody drinks. Pass to next person to roll!'
      end

    else
      # game is over!
      explanation_text = 'Begin a new round?'
    end

    return explanation_text
  end

  def advance_game
    @stage += 1
  end

end