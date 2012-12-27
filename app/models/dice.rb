class Dice
  DEFAULT_ANSWERS = ['1', '2', '3', '4', '5', '6']
  
  def initialize
    @answers = loadAnswers
  end
  
  #---------------------
  
  def randomAnswer
    @answers.sample
  end

  #---------------------
  
  def loadAnswers
    answerFile = NSBundle.mainBundle.pathForResource('answers', ofType: 'json')
    errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(answerFile, 
      :options => NSDataReadingUncached, 
      :error   => errorPointer)
    
    if !data
      printError errorPointer[0]
      return DEFAULT_ANSWERS
    end
    
    json = NSJSONSerialization.JSONObjectWithData(data,
      :options => NSDataReadingUncached,
      :error   => errorPointer)
      
    if !json
      printError errorPointer[0]
      return DEFAULT_ANSWERS
    end
    
    json['answers']
  end

  #---------------------

  private
  
  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end
end
