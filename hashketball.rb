require 'pry'
# Write your code here!
def game_hash
	game_hash = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {:number => 0, 
									:shoe => 16, 
									:points => 22,
									:rebounds => 12,
									:assists => 12,
									:steals => 3,
									:blocks => 1,
									:slam_dunks => 1
				},
				"Reggie Evans" =>{:number => 30,
								  :shoe => 14,
								  :points => 12,
								  :rebounds => 12,
								  :assists => 12,
								  :steals => 12,
								  :blocks => 12,
								  :slam_dunks => 7

				},
				"Brook Lopez" => {:number => 11,
								  :shoe => 17,
							      :points => 17,
							      :rebounds => 19,
								  :assists => 10,
							      :steals => 3,
								  :blocks => 1,
								  :slam_dunks => 15

				},
				"Mason Plumlee" => {:number => 1,
									:shoe => 19,
									:points => 26,
									:rebounds => 12,
									:assists => 6,
							        :steals => 3,
								    :blocks => 8,
								    :slam_dunks => 5
				},
				"Jason Terry" => {:number => 31,
								  :shoe => 15,
								  :points => 19,
								  :rebounds => 2,
								  :assists => 2,
							      :steals => 4,
								  :blocks => 11,
								  :slam_dunks => 1
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {:number => 4,
								  :shoe => 18,
								  :points => 10,
								  :rebounds => 1,
								  :assists => 1,
							      :steals => 2,
								  :blocks => 7,
								  :slam_dunks => 2
				},
				"Bismak Biyombo" => {:number => 0,
									 :shoe => 16,
									 :points => 12,
									 :rebounds => 4,
									 :assists => 7,
							         :steals => 7,
								     :blocks => 15,
								     :slam_dunks => 10
				},
				"DeSagna Diop" => {:number => 2,
								   :shoe => 14,
								   :points => 24,
								   :rebounds => 12,
								   :assists => 12,
							       :steals => 4, 
								   :blocks => 5,
								   :slam_dunks => 5
				},
				"Ben Gordon" => {:number => 8,
								 :shoe => 15,
								 :points => 33,
								 :rebounds => 3,
								 :assists => 2,
							     :steals => 1,
								 :blocks => 1,
								 :slam_dunks => 0
				},
				"Brendan Haywood" => {:number => 33,
									  :shoe => 15,
									  :points => 6,
									  :rebounds => 12,
									  :assists => 12,
							      	  :steals => 22,
								  	  :blocks => 5,
								  	  :slam_dunks => 12
				}
			}
		}
	}
end

def num_points_scored(player_name)
	points_scored = []
	game_hash.each do |location, team_data|
		team_data.each do |attributes, data|
			if attributes == :players
				data.each do |player, player_stats|
					if player == player_name
					points_scored = player_stats[:points]
					end
				end
			end
		end
	end
	points_scored
end

def shoe_size(player_name)
	size_shoe = []
	game_hash.each do |location, team_data|
		team_data.each do |attributes, data|
			if attributes == :players
				data.each do |player, player_stats|
					if player == player_name
					size_shoe = player_stats[:shoe]
					end
				end
			end
		end
	end
	size_shoe
end

def team_colors(team_name)
	teams_colors = []
	game_hash.each do |location, team_data|
		team_data.each do |data, value|
			if value == team_name
			teams_colors = team_data[:colors]
			end
		end
	end
	teams_colors
end

def team_names
	teams = []
	game_hash.each do |location, team_data|
		team_data.each do |data, value|
			if data == :team_name
			teams << value
			end
		end
	end
	teams
end

def player_numbers(team_name)
	jersey_numbers = []
	game_hash.each do |location, team_data|
		if team_name == team_data[:team_name]
			team_data.each do |attributes, data|
				if attributes == :players
					data.each do |player, stats|
						stats.each do |key, value|
							if key == :number
								jersey_numbers << value
							end
						end
					end
				end
			end
		end
	end
	jersey_numbers
end

def player_stats(player_name)
	stats = {}
	game_hash.each do |location, team_data|
		team_data.each do |attributes, data|
			if attributes == :players
				data.each do |player, p_stats|
					if player == player_name
					stats = p_stats
					end
				end
			end
		end
	end
	# binding.pry
	stats
end

def players
	game_hash[:home][:players].merge(game_hash[:away][:players])
end

def big_shoe_rebounds
	players.max_by {|player, stats| stats.fetch(:shoe)}[1].fetch(:rebounds)
end