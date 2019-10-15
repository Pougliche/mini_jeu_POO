require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Spider-Man")                          #On crée deux profils de personnages qui vont s'affronter
player2 = Player.new("Green-Goblin")

while player1.life_points > 0 && player2.life_points > 0    #Cette condition permet à la boucle de s'effectuer tant que les HP des deux personnages sont supérieurs à 0
    
    puts "Here are our fighters status :"
    puts player1.show_state.red
    puts player2.show_state.green
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".blue
    puts "LETS GET READY TO RUMBLE !!!".blue                #On ajoute de la couleur grâce à la gem colorize et de simples commandes sur les puts
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".blue
    puts player1.attacks(player2)                           #Le premier joueur attaque le second

    if player2.life_points > 0
        puts player2.attacks(player1)                       #Au tour du second d'attaquer si ses HP sont supérieurs à 0. Sinon, la boucle break et le jeu se termine.
    else 
    break

    end

end

if player2.life_points < 0                                 #Si player 2 n'a plus de point de vie, un message annonce la victoire de player 1. Sinon, un message annonce la victoire de player 2.
    puts "The Friendly Neighborhood Spider-Man wins ! With great power comes great responsabilities".red
    else puts "Green Goblin wins ! Oscorp stock goes up 20% ! ".green
end

puts "GAME OVER. THANKS FOR PLAYING AND STAY HYDRATED !".blue                   #Message de fin de jeu, en dehors de la boucle.



