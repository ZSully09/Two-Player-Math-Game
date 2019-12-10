require_relative 'game'
require_relative 'player'

class Question
  attr_accessor :num1, :num2, :correct_answer, :question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correct_answer = @num1 + @num2
    @question = "What does #{@num1} plus #{@num2} equal?"
  end

  def check(ans)
    
    ans.to_i == @correct_answer
  end
end