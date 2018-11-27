require "pry"
# Write your code here!
def game_hash
  teams = {

    home: {

      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
      },
        "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
      },
          "Brook Lopez" => {
              number: 11,
              shoe: 17,
              points: 17,
              rebounds: 19,
              assists: 10,
              steals: 3,
              blocks: 1,
              slam_dunks: 15
        },
          "Mason Plumlee" => {
              number: 1,
              shoe: 19,
              points: 26,
              rebounds: 12,
              assists: 6,
              steals: 3,
              blocks: 8,
              slam_dunks: 5
        },
          "Jason Terry" => {
              number: 31,
              shoe: 15,
              points: 19,
              rebounds: 2,
              assists: 2,
              steals: 4,
              blocks: 11,
              slam_dunks: 1
        } # end of Jason
      } #end of players
    }, # end of home

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {

        "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
        }, # end of player n
          "Bismak Biyombo" => {
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 7,
              blocks: 15,
              slam_dunks: 10
          }, # end of player na
            "DeSagna Diop" => {
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            }, # end of player nam
              "Ben Gordon" => {
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0
              }, # end of player name
                "Brendan Haywood" => {
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 22,
                    blocks: 5,
                    slam_dunks: 12
                } # end of player name
      } # end of players
    } # end of away
  } # end of teams
end

# def num_points_scored(player_name)
#   game_hash.each do |teams, team_data| # teams == home/away | team_data == teams' key
#     team_data.each do |attribute, data|  # attribute == keys || data == value
#       if attribute == :players
#         data.each do |name, stats| # name is the players names | stats is their stats
#           if player_name == name
#             stats.each do |k, v|
#               if k == :points
#                 return v
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end

def num_points_scored(player_name) #improved and shorter method
  game_hash.each do |location, attributes| # location gets the team and attributes is everything in it like players
    attributes[:players].each do |name, stats| # attributes[:players] to only get the players and itterate through it
      if name == player_name # if the key is == to the name then that is the block we want
        return stats[:points] # we access the value to get the points
      end
    end
  end
end

# def shoe_size(player_name)
#   game_hash.each do |teams, team_data| # teams == home/away | team_data == teams' key
#     team_data.each do |attribute, data|  # attribute == keys || data == value
#       if attribute == :players
#         data.each do |name, stats| # name is the players names | stats is their stats
#           if player_name == name
#             stats.each do |k, v|
#               if k == :shoe
#                 return v
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end

def shoe_size(player_name) # shorter version
  game_hash.each do |location, info| # itterate through the data
    info[:players].each do |player_name2, stats|
      if player_name == player_name2
        return stats[:shoe]
      end
    end
  end
end

# def team_colors(x)
#   game_hash.each do |team, traits| # team is either home or away | traits is their values
#     traits.each do |attribute, value|
#       if value == x # if the value of x which is the give argument exist in the values
#         traits.each do |key, color| # then we use the traits again to only iterate through the trait with the value
#           if key == :colors # now that our :color is limited to one we can just return that color
#             return color
#           end
#         end
#       end
#     end
#   end
# end

def team_colors(x) # much shorter and improved
  game_hash.each do |location, info| # itterate through the hash to get the info
    if info[:team_name] == x # if our argument is == to the team name then we use that block
      return info[:colors] # using that block we return the colors
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, attribute|
    attribute.each do |key, value|
      if key == :team_name
        teams << value
      end
    end
  end
  return teams
end

def player_numbers(team_name) # return array of teams jersey #
  arr = []
  game_hash.each do |location, attribute|
    attribute.each do |keys, value|
      if value == team_name #if the team name matches
        attribute.each do |k, v|
          if k == :players
            v.each do |player, numbers|
              numbers.each do |x, y|
                if x == :number
                  arr << y
                end
              end
            end
          end
        end
      end
    end
  end
  return arr
end

def player_stats(player)
  game_hash.each do |location, attributes|
    attributes.each do |key, values| #key is team name colors players
      if key == :players
        values.each do |k, v|
          if k == player
            return v
          end
        end
      end
    end
  end
end

def big_shoe_rebounds # find the person with the biggest shoe and return the amount of rebounds they have


  shoe_hash = Hash.new(0)

  game_hash.each do |location, attributes|
    attributes.each do |key, values|
      if key == :players
        values.each do |name, status|
          status.each do |k, v|
            if k == :shoe
              shoe_hash[name] = v
            end
          end
        end
      end
    end
  end
  sorted = shoe_hash.sort_by { |k, v| v}
  biggest_shoe = sorted[-1][0] # Mason Plumlee 19

  game_hash.each do |location, attributes|
    attributes.each do |key, values|
      if key == :players
        values.each do |k, v|
          if k == biggest_shoe
            v.each do |rebound, rebound_value|
              if rebound == :rebounds
                return rebound_value
              end
            end
          end
        end
      end
    end
  end
end
