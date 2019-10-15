require "colorize"
#require "pry"

class Player
    attr_accessor :name, :life_points
    @@bot_list=Array.new

    def initialize (players_name)
        @name = players_name
        @life_points = 10
        @@bot_list<<self
    end
   
    def show_state
        return "#{@name} has #{@life_points} life points left"
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
        return rand(1..6)
    end

end

class HumanPlayer
    attr_accessor :name, :life_points

    def initialize (players_name)
        @name = players_name
        @life_points = 100
        @weapon_level = 1
    end
   
    def show_state
        return "#{@name} has #{@life_points} life points left and a level #{@weapon_level} weapon."
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
        return rand(1..6) * @weapon_level
    end

    def search_weapon

        new_weapon = rand(1..6)
        if new_weapon > @weapon_level
        @weapon_level = new_weapon
        puts "Congratulations ! This weapon is better than your current one. You take it."

        else
        puts "This weapon sucks. You keep your good ol' sword"

        end
    end

    def search_healthpack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "You have found nothing. Your life is a joke."
        elsif
            health_pack > 1 && health_pack < 6
            puts "Neat! You have found a 50HP Health Pack!"
            @life_points = @life_points + 50
            if @life_points > 100 
            @life_points = 100
            end
        else health_pack == 6
            puts "Conglaturations! You have found a 80HP Health Pack!"
            @life_points = @life_points + 80
            if @life_points > 100
                @life_points = 100
            end
        end
    end    
end
