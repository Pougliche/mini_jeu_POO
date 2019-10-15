require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< HIGHLANDER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>".blue
puts "THERE CAN BE ONLY ONE WINNER. WILL YOU SURVIVE THE GAME WITHOUT THRONE?".blue             #Insérer de superbes références pour amuser l'utilisateur

puts "What is your name?"                                   #On récupère le nom du participant grâce à gets chomp
user_name = gets.chomp 
user = HumanPlayer.new(user_name)                           #On utilise l'input pour créer un nouveau profil

player1 = Player.new("Spider-Man")
player2 = Player.new("Green-Goblin")
players = [player1, player2]                                #On recrée ici nos deux combattants IA avant de les insérer dans un array.

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)          #La boucle continue tant que le joueur humain a des HP supérieurs à 0 ET que le premier OU le second joueur IA est dans la même condition
    puts "Here is your current status :"
    puts user.show_state
    puts "What do you want to do?"
    puts "a - Search for a better weapon".blue              #On puts différentes actions possibles pour le joueur
    puts "s - Look for some healthpack".yellow
    puts "                                         "                                                                              
    puts "Attack an enemy player :"
        if player1.life_points <=0
            puts "Spider-Man has been defeated. The wall crawler wont bother us anymore.".red           #Si Spider-Man a des HP supérieurs à 0, le message proposant de l'attaquer apparait. Dans le cas contraire, un message annonçant sa défaite est inséré à la place. (Dans le code, c'est plutôt si Spider-Man a des HP inférieur ou égal à 0, mettre le message de mort. Sinon, proposer d'attaquer)
            else
                puts "0 - Spider-Man has #{player1.life_points} HP".red         #La commande pour attaquer rappelle les HP actuels de Spider-Man pour informer le joueur
        end
    
        if player2.life_points <=0
            puts "Green-Goblin has been defeated. Back to formula, Norman ".green
            else
                puts "1 - Green-Goblin has #{player2.life_points} HP".green
        end

    user_input = gets.chomp                                 #Un gets chomp permet de récupérer l'action choisie par le joueur. Une série de If permet ensuite d'attribuer chaque input à l'action correspondante.

    if user_input == "a" 
        user.search_weapon
        elsif user_input == "s" 
            user.search_healthpack                          #Pour chaque option, on rappelle la méthode correspondante dans le fichier player.rb
        elsif user_input == "0" 
            user.attacks(player1)
        elsif user_input == "1" 
            user.attacks(player2)
    end

    if player1.life_points > 0 || player2.life_points > 0
        puts "ITS THE ENEMY TURN TO ATTACK".red             #Si player 1 OU player 2 a des HP supérieur à 0, ils vont attaquer le joueur

        players.each do |players|
            if players.life_points > 0                      #Each/do pour faire attaquer chaque ennemi (Si ils sont en vie, encore une fois. Un ennemi mort n'attaquera plus.)
                players.attacks(user)
            end
        end
    end           #Ne jamais oublier aucun End
end

    puts "GAME OVER".red            #On est sorti de la boucle, un message indiquant la fin du jeu est puts.

    if user.life_points < 0                                 #Si l'utilisateur n'a plus de point de vie, un message de défaite est affiché. Dans le cas contraire, c'est le contraire. (Logique?)
        puts "You just lost at THE GAME !".red
        else puts "Conglaturations, you have completed a great game ! ".blue
    end

