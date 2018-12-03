require "pry"

def game_hash
  {
    :home => {:team_name => "Brooklyn Nets",
              :colors => ["Black","White"], 
              :players => {"Alan Anderson" => {
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
              
    :away => {:team_name => "Charlotte Hornets",
              :colors => ["Turquoise","Purple"], 
              :players => {"Jeff Adrien" => {
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
end




def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name,stat_info|
      if name == player_name
        return stat_info[:points]
          binding.pry
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      #binding.pry
      if attribute.to_s == "players"
        data1.each do |name,data2|
          if name.to_s == player_name
            data2.each do |statistic, value|
              if statistic.to_s == "shoe"
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if data1.to_s == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  team_names = []
  
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if attribute.to_s == "team_name"
        team_names << game_hash[location][attribute]
      end
    end
  end
  
  return team_names
end

def player_numbers(team_name)
  numbers = []
  
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if data1.to_s == team_name
          game_hash[location][:players].each do |name,info|
            info.each do |info_type,value|
              if info_type.to_s == "number"
                numbers << value
              end
            end
          end
      end
    end
  end
  
  return numbers
end

def player_stats(player_name)
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if attribute.to_s == "players"
        data1.each do |name, stats|
          if name.to_s == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if attribute.to_s == "players"
        data1.each do |name,info|
          info.each do |info_type,value|
            if info_type.to_s == "shoe"
              shoe_sizes << value
            end
          end
        end
      end
    end
  end
  
  largest = shoe_sizes.max
  
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data1|
      if attribute.to_s == "players"
        data1.each do |name,info|
          info.each do |info_type,value|
            if info_type.to_s == "shoe" && value.to_i == largest
              return game_hash[location][attribute][name][:rebounds]
            end
          end
        end
      end
    end
  end
end


def player_by_num(num)
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_name,stat_info|
      if stat_info[:number] == num
        return player_name
      end
    end
  end
end

puts player_by_num(33)



