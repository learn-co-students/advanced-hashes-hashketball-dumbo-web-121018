def game_hash
  {
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
        }
      }
    },
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
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

###

def num_points_scored(name) # name is player name given to find how many points he scored
  game_hash.each do |location, team_data| # for each team in game_hash, it'll pull the team name and their data
    players_array = team_data[:players] # finds :players part of team data for both teams and puts them into an array
    players_array.each do |player_name, data| # for each team, it'll go through the players on BOTH teams with their accompanying data
      if player_name == name # if the name matches the name given as an argument for num_points_scored(name) then..
        return data[:points] # this will go into their 'data' (which was accessed two lines up next to 'player_name')
                             # and find return their points value :points
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data|
      if player_name == name
        return data[:shoe] # pretty much the same method used above but instead of points, we look at the shoe value :shoe
      end
    end
  end
end

def team_colors(team) # finds the colors of the team you put in the argument
  game_hash.each do |location, team_data| # same method as above, but one level higher
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names # create an array containing both teams
  the_teams = [] # empty array to put the teams in
  game_hash.each do |location, team_data| # for each team and their accompanying data for that level
    the_teams.push(team_data[:team_name]) # enter into their team_data (accessed one line above),
                                          # find their :team_name's, and push it into the_teams array we made that was empty
  end
  the_teams
end

def player_numbers(team) # gonna create an array of team numbers for a particular team in this method.. enter in a team as an argument
  player_numbers_array = [] # this is the array where we'll put the numbers
  game_hash.each do |location, team_data| # goes through each team and their data..
    if team_data[:team_name] == team # if the team name matches the one we used in the beginning as an argument.. then..
      players_array = team_data[:players] # grab the team_data for that team (accessed two lines up) and create an array of the :players
      players_array.each do |player_name, data| # for each of the players now in players_array, access each player's name and data..
        player_numbers_array.push(data[:number]) # and find each of their :number's and push it onto the empty player_numbers_array
      end
    end
  end
  return player_numbers_array
end

def player_stats(name) # entering in a players name to find stats for
  game_hash.each do |location, team_data| # iterates through both teams and their accompanying data for that level "team_data"
    players_array = team_data[:players] # find the part of the team_data that says :players and put it into players_array
    players_array.each do |player_name, data| # now that all the players of the team are in the array along with their accompanying stats
      if player_name == name                  # we iterate through each of them until their name matches the one we put as our method argument
        return data                           # then we return that individuals players stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0 # starting size to compare with players shoe sizes
  rebounds = 0 # starting rebounds to compare with players' rebounds
    game_hash.each do |location, team_data| # iterates through each team
    players_array = team_data[:players] # finds the :players info in team_data and puts the players into players_array
    players_array.each do |player_name, data| # iterates through each player..
      if data[:shoe] > shoe_size # if their shoe size is greater than 0 (we set this earlier in the top of method)
        shoe_size = data[:shoe] # take that shoe size and make it the new shoe_size value
        rebounds = data[:rebounds] # for that current player that we're iterating through, also make the rebounds value their rebounds.
      end # this repeats (iterates) through all players until you don't have any more.. meaning the end result is the player with
    end   # the biggest shoe size, which will also have his accompanying rebounds score.
  end
  return rebounds
end


####### BONUS #######

# Which player has the most points? Call the method most_points_scored.

def most_points_scored
  points_scored = 0 # starting score to compare with players shoe sizes
    game_hash.each do |location, team_data| # iterates through each team
    players_array = team_data[:players] # finds the :players info in team_data and puts the players into players_array
    players_array.each do |player_name, data| # iterates through each player..
      if data[:points] > points_scored # if their points scored is greater than 0 (we set this earlier in the top of method)
        points_scored = data[:shoe] # take that players score and make it the new points_scored value
      end # this repeats (iterates) through all players until you don't have any more.. meaning the end result is
    end   # the player with the highest score
  end
  return points_scored
end

# Which team has the most points? Call the method winning_team.
# Which player has the longest name? Call the method player_with_longest_name.

####### SUPER BONUS #######
# Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.
#
