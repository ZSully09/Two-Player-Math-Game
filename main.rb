require './players'
require './games'

puts "Player 1 please enter your name"
name1 = gets.chomp
player1 = Players.new(name1)
puts player1.name

puts "Player 2 please enter your name"
name2 = gets.chomp
player2 = Players.new(name2)
puts player2.name

