require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Spider-Man")
player2 = Player.new("Green-Goblin")


while player1.life_points > 0 && player2.life_points > 0 
    
    puts "Here are our fighters status :"
    puts player1.show_state.blue
    puts player2.show_state.green
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".red
    puts "LETS GET READY TO RUMBLE !!!".red 
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".red
    puts player1.attacks(player2)

    if player2.life_points > 0
        puts player2.attacks(player1)
    else 
    break

    end

end

puts "GAME OVER. THANKS FOR PLAYING"



