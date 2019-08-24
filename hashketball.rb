require "pry"

def game_hash
		  {
		    away: { team_name: 'Charlotte Hornets',
		            colors: %w[Turquoise Purple],
		            players: [
		              { player_name: 'Jeff Adrien',
		                number: 4,
		                shoe: 18,
		                points: 10,
		                rebounds: 1,
		                assists: 1,
		                steals: 2,
		                blocks: 7,
		                slam_dunks: 2 },
		              { player_name: 'Bismack Biyombo',
		                number: 0,
		                shoe: 16,
		                points: 12,
		                rebounds: 4,
		                assists: 7,
		                steals: 22,
		                blocks: 15,
		                slam_dunks: 10 },
		              { player_name: 'DeSagna Diop',
		                number: 2,
		                shoe: 14,
		                points: 24,
		                rebounds: 12,
		                assists: 12,
		                steals: 4,
		                blocks: 5,
		                slam_dunks: 5 },
		              { player_name: 'Ben Gordon',
		                number: 8,
		                shoe: 15,
		                points: 33,
		                rebounds: 3,
		                assists: 2,
		                steals: 1,
		                blocks: 1,
		                slam_dunks: 0 },
		              { player_name: 'Kemba Walker',
		                number: 33,
		                shoe: 15,
		                points: 6,
		                rebounds: 12,
		                assists: 12,
		                steals: 7,
		                blocks: 5,
		                slam_dunks: 12 }
		            ] },
		    home: { team_name: 'Brooklyn Nets',
		            colors: %w[Black White],
		            players: [
		              { player_name: 'Alan Anderson',
		                number: 0,
		                shoe: 16,
		                points: 22,
		                rebounds: 12,
		                assists: 12,
		                steals: 3,
		                blocks: 1,
		                slam_dunks: 1 },
		              { player_name: 'Reggie Evans',
		                number: 30,
		                shoe: 14,
		                points: 12,
		                rebounds: 12,
		                assists: 12,
		                steals: 12,
		                blocks: 12,
		                slam_dunks: 7 },
		              { player_name: 'Brook Lopez',
		                number: 11,
		                shoe: 17,
		                points: 17,
		                rebounds: 19,
		                assists: 10,
		                steals: 3,
		                blocks: 1,
		                slam_dunks: 15 },
		              { player_name: 'Mason Plumlee',
		                number: 1,
		                shoe: 19,
		                points: 26,
		                rebounds: 11,
		                assists: 6,
		                steals: 3,
		                blocks: 8,
		                slam_dunks: 5 },
		              { player_name: 'Jason Terry',
		                number: 31,
		                shoe: 15,
		                points: 19,
		                rebounds: 2,
		                assists: 2,
		                steals: 4,
		                blocks: 11,
		                slam_dunks: 1 }
		            ] }
		  }
		end


def num_points_scored(name)
	game_hash.each do |place, team|
		team.each do |attribute, data|
 			if attribute == :players
				data.each do |player|
 					if player[:player_name] == name
						 return player[:points]
					end
 				end
 			end
 		end
	end
 end
 
# def num_points_scored(player_n)
#   game_hash.each do |home_away, keys|
#     # keys[:players].each do |player|
#     team.each do |attribute, data| 
#       return player[:points]
#       if player[:player_name] == player_n
#     end
#   end
# end

# def shoe_size(player_n)
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       return player[:shoe] 
#       if player[:player_name] == player_n
#     end
#   end
# end

def shoe_size(player_name) 
  game_hash.each do |place,team| 
    team.each do |attribute,data| 
      if attribute == :players 
        data.each do |player| 
          if player[:player_name] == player_name 
            return player[:shoe] 
            end
          end  
        end 
      end 
  end 
end

def team_colors(team_name)
  game_hash.each do |away, keys|
    if keys[:team_name] == team_name
      return keys[:colors].map(&:capitalize)
    end
  end
end

def team_names
  game_hash.map do |place, team| 
    team[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each do |away, keys|
    if keys[:team_name] == team_name
      return keys[:players].map { |player| player[:number] }
    end
  end
end

def player_stats(player_n)
  game_hash.each do |away, keys|
    keys[:players].each do |player|
      if player[:player_name] == player_n
        return player.delete_if {|stat, value| [:player_name].include?(stat)}
      end
    end
  end
end


def big_shoe_rebounds
  biggest = 0
  rebounds = 0
  game_hash.each do |away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  mvp = ''
  game_hash.each do |away, keys|
    keys[:players].each do |player|
      points = player[:points]
      if points > most_points
        most_points = points
        mvp = player[:player_name]
      end
    end
  end
  mvp
end

def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |away, keys|
    team_points = 0
    team_name = game_hash[away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end

def player_with_longest_name
    longest_name = []
  game_hash.values.each do |team|
    team[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
longest_name.max_by{|name| name.length}
end

def long_name_steals_a_ton?
   longest = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      longest[player[:player_name]] = player[:steals]
    end
  end
most_steals = longest.values.max
longest[longest.key(most_steals)] == most_steals
end