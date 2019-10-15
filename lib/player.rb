#require "pry"

class Player
    attr_accessor :name, :life_points

    def initialize (players_name)
        @name = players_name
        @life_points = 10
    end
   
    def show_state
        return "#{@name} has #{@life_points} life points"
    end

    def gets_damage(damage_received,player_attacked)
        player_attacked.life_points = player_attacked.life_points - damage_received

        if player_attacked.life_points <= 0 
            puts "#{player_attacked.name} is dead. #{player_attacked.name}'s memory will never be forgotten."
        else 
            puts "#{player_attacked.name} has #{player_attacked.life_points} life points"
        end
    end

    def attacks(player_attacked)
        puts "#{@name} has attacked #{player_attacked.name}"
        damage_done = compute_damage
        puts gets_damage(damage_done,player_attacked)
    end

    def compute_damage
        return rand(1..6)
    end

end

#binding.pry