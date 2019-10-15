require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< HIGHLANDER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>".blue
puts "THERE CAN BE ONLY ONE WINNER. WILL YOU SURVIVE THE GAME WITHOUT THRONE?".blue

puts "What is your name?"
user_name = gets.chomp 
user = HumanPlayer.new(user_name)

player1 = Player.new("Spider-Man")
player2 = Player.new("Green-Goblin")
players = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "Here is your current status :"
    puts user.show_state
    puts "What do you want to do?"
    puts "a - Search for a better weapon"
    puts "s - Look for healthpack"
    puts "                                         "                                                                              
    puts "Attack an enemy player :"
    if player1.life_points <=0
        puts "Il est mort"
    else
    puts "0 - Spider-Man has #{player1.life_points} HP"
    end
    if player2.life_points <=0
        puts "Il est mort"
    else
    puts "1 - Green-Goblin has #{player2.life_points}"
    end

    user_input = gets.chomp

    if user_input == "a" 
        user.search_weapon
    elsif user_input == "s" 
        user.search_healthpack
    elsif user_input == "0" 
        user.attacks(player1)
    elsif user_input == "1" 
        user.attacks(player2)
    end

    if player1.life_points > 0 && player2.life_points > 0
        puts "ITS THE ENEMY TURN TO ATTACK"

        players.each do |players|
            if players.life_points > 0
                players.attacks(user)
            end
        end
    end
end

    puts "GAME OVER"

    if user.life_points < 0
        puts "Conglaturations, you have won !"
        else puts "You win General Kenobi !"
    end

