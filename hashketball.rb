require 'pry'

# Write your code here!
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
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
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
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
  game
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |names, stats|
      if (names == name)
        return stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |names, stats|
      if (names == name)
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  out = []
  game_hash.each do |location, team_data|
    out << team_data[:team_name]
  end
  out
end

def player_numbers(team_name)
  out = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, stats|
        out << stats[:number]
      end
    end
  end
  out
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if (name == player_name)
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:shoe] > biggest_shoe_size
        biggest_shoe_rebounds = stats[:rebounds]
      end
    end
  end
  biggest_shoe_rebounds
end

def most_points_scored
  highest_score = 0
  highest_scorer = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:points] > highest_score
        highest_scorer = name
        highest_score = stats[:points]
      end
    end
  end
  highest_scorer
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |name, stats|
    home_score += stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away_score += stats[:points]
  end
  if home_score > away_score
    return game_hash[:home][:team_name]
  elsif away_score > home_score
    return game_hash[:away][:team_name]
  else
    return "Tie game"
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.length > longest_name.length
        longest_name = name
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  longest_name_steals = player_stats(longest_name)[:steals]
  most_steals = player_with_longest_name
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:steals] > longest_name_steals
        most_steals = name
      end
    end
  end
  if most_steals != longest_name
    return false
  else
    return true
  end
end

puts most_points_scored
puts winning_team
puts player_with_longest_name
puts long_name_steals_a_ton?
