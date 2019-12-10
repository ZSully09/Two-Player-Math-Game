require_relative 'player'
require_relative 'question'

class Game
attr_reader :turn

  def initialize
    p 'Player1 enter your name if you dare!'
    @name1 = gets.chomp
    p 'Player2 enter your name if you dare!'
    @name2 = gets.chomp
    @player1 = Player.new(@name1)
    @player2 = Player.new(@name2)
    @players = [@player1, @player2]
    @turn = 0
    play
  end

  def play
    @playing_game = true
    while @playing_game
      if play_turn
        @playing_game = false
      end
    end
    p '🔥⚡️🔥⚡️🔥⚡️🔥⚡️FINITO🔥⚡️🔥⚡️🔥⚡️🔥⚡️'
  end


  def play_turn
    @question = Question.new
    p "🔥⚡️🔥⚡️🔥⚡️🔥⚡️ NEXT QUESTION 🔥⚡️🔥⚡️🔥⚡️🔥⚡️"
    p "#{@players[@turn].name}: #{@question.question}"
    @answer = gets.chomp
    @ans = @question.check(@answer)
    if (@ans)
      p "#{@players[@turn].name}: Way to go!"
    else
      @players[@turn].reduce_lives
      p "#{@players[@turn].name}: You're smarter than that! Player1 has #{@player1.lives}/3 lives remaining and Player2 has #{@player2.lives}/3 lives remaining!!!"
    end
    if @players[@turn].lives <= 0
      next_turn
      p "#{@players[@turn].name} wins with a score of #{@players[@turn].lives}/3"
      return true
    end
    next_turn
    return false
  end

  def next_turn
    if @turn === 0
      @turn = 1
    else 
      @turn = 0
    end
  end
end

game = Game.new

# puts "Player 1 please enter your name"
# # name1 = gets.chomp
# @player1 = Player.new(name1)
# # puts player1.name

# puts "Player 2 please enter your name"
# # name2 = gets.chomp
# # puts player2.name
# @player2 = Player.new(name2)
# puts "BEGIN!!!"



# while player1.lives > 0 && player2.lives > 0
# # while !player1.dead? && !player2.dead?
#   num1 = rand(1..20)
#   num2 = rand(1..20)
#   correct_answer = num1 + num2
#   Question.new(num1, num2, correct_answer)

  # q = Question.new
  # q.ask(players[player_index])

#   guess = gets.chomp
#   if correct_answer != guess
    
#     "LOSER, the correct answer is #{correct_answer}!"
#     puts correct_answer
#   end

#   if q.check(guess)
#     # say we're okay
#   else
#     # what do we do if they failed?
#     # reduce their lives
#     # wait, reduce WHOSE lives?
#     # we'll need to have a variable telling us who is playing
#     # (partly we can tell them the correct answer?)
#   end

#   # show total scores

#   # now that the turn is nearrrrly over, what now?
#   # it's the other player's turn now!

# end


# game = Game.new(player1, player2)
# game.play