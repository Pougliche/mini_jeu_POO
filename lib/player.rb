require "colorize"                  #Gem utilisée pour colorer certains textes, nécessaire pour afficher le programme.
#require "pry"

class Player
    attr_accessor :name, :life_points           #On crée la classe "Player", qui contiendra toutes les caractéristiques & actions possibles de ces profils
    @@bot_list=Array.new                        #On crée ici un array pour ranger les différents profils de "Player"

    def initialize (players_name)
        @name = players_name
        @life_points = 10
        @@bot_list<<self                        #Cette commande permet d'ajouter les différents profils dans l'array. Ajoutée à Initialize car devra s'executer à chaque ajout d'un nouveau profil. 
    end
   
    def show_state
        return "#{@name} has #{@life_points} life points left"              #Cette def permet de récupérer les données de nom & points de vie afin de les afficher durant le jeu.
    end

    def gets_damage(damage_received,player_attacked)
        player_attacked.life_points = player_attacked.life_points - damage_received             #Formule pour calculer les HP d'un personnage après avoir reçu des dommages

        if player_attacked.life_points <= 0                                     #Si les HP d'un personnage atteignent 0 ou un négatif, un message indiquant sa mort est puts ; sinon, il s'agit juste d'un points sur ses HP.
            puts "#{player_attacked.name} is dead. #{player_attacked.name}'s memory will never be forgotten."
        else 
            puts "#{player_attacked.name} has #{player_attacked.life_points} life points left"
        end
    end

    def attacks(player_attacked)                                
        puts "#{@name} attacks #{player_attacked.name}".yellow      
        damage_done = compute_damage                #Méthode gérant les attaques en rappelant la méthode de lancer de dé ci-dessous. On envoie ensuite les informations obtenues dans la méthode permettant d'appliquer les dégats reçus au personnage.
        puts gets_damage(damage_done,player_attacked)
    end

    def compute_damage                              #Cette méthode lance un dé afin de connaitre la puissance de l'attaque entre 1 & 6
        return rand(1..6)
    end

end

class HumanPlayer                                   #Cette classe sert à définir les profils de joueur controlé par un humain. Globalement la même que précédemment, à quelques détails près.
    attr_accessor :name, :life_points

    def initialize (players_name)
        @name = players_name
        @life_points = 100
        @weapon_level = 1               #On ajoute le weapon level dans initialize, il s'agit d'un paramètre qui sera attribué automatiquement à chaque joueur humain.
    end
   
    def show_state
        return "#{@name} has #{@life_points} life points left and a level #{@weapon_level} weapon."         #Le statut de l'arme est également ajouté ici.
    end

    def gets_damage(damage_received,player_attacked)
        player_attacked.life_points = player_attacked.life_points - damage_received

        if player_attacked.life_points <= 0 
            puts "#{player_attacked.name} is dead. #{player_attacked.name}'s memory will never be forgotten."
        else 
            puts "#{player_attacked.name} has #{player_attacked.life_points} life points left"
        end
    end

    def attacks(player_attacked)
        puts "#{@name} attacks #{player_attacked.name}".yellow
        damage_done = compute_damage
        puts gets_damage(damage_done,player_attacked)
    end

    def compute_damage
        return rand(1..6) * @weapon_level           #Le niveau de l'attaque est multiplié par le niveau de l'arme
    end

    def search_weapon

        new_weapon = rand(1..6)
        if new_weapon > @weapon_level       #A l'aide d'une condition et d'un dé, on lance une recherche de nouvelle arme. Si la nouvelle arme est d'un niveau supérieur, elle remplace automatiquement la précédente.
        @weapon_level = new_weapon
        puts "Congratulations ! This weapon is better than your current one. You take it."

        else            #Dans le cas contraire, rien ne se passe pour le niveau de l'arme, et un message est affiché pour indiquer que rien de nouveau ne s'est produit.
        puts "This weapon sucks. You keep your good ol' sword"

        end
    end

    def search_healthpack           #Comme pour les armes, on va lancer une recherche pour un healthpack grâce à un lancer de dé.
        health_pack = rand(1..6)
        if health_pack == 1         #Si le dé retourne 1, on ne trouve rien.
            puts "You have found nothing. Your life is a joke."
        elsif
            health_pack > 1 && health_pack < 6          #Entre 2 et 5 inclus, on trouve un kit pour 50HP. 
            puts "Neat! You have found a 50HP Health Pack!"
            @life_points = @life_points + 50
            if @life_points > 100                   #Si jamais les HP de l'utilisateurs dépassent 100, on remet automatiquement sa valeur à 100 (ce sera notre maximum)
            @life_points = 100
            end
        else health_pack == 6
            puts "Conglaturations! You have found a 80HP Health Pack!"
            @life_points = @life_points + 80            #Même chose que précédemment, si les HP du joueur dépassent 100, ils sont remis à 100 automatiquement grâce à cette condition.
            if @life_points > 100
                @life_points = 100
            end
        end
    end    
end
