
require 'pry'

def get_first_name_of_season_winner(data, season)
  #returns first name of that season's winner
  #need to do string manipulation to return only first name
  data.each do |s_num, contestants|
    if s_num == season
      contestants.each do |cont_keys, cont_values|
        if cont_keys["status"] == "Winner"
          return cont_keys["name"].split(" ")[0]
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  #returns the name of the woman who has that occupation
  data.each do |s_num, contestants|
    contestants.each do |cont_keys, cont_values|
      if cont_keys["occupation"] == occupation
        return cont_keys["name"]
      end
    end
  end
end

# def count_contestants_by_hometown(data, hometown)
#   #should return a counter of the number of contestants who are from that hometown
#   #probably use.length on an array
#   hometown_count = []
#   data.each do |s_num, contestants|
#     contestants.each do |cont_keys, cont_values|
#       if cont_keys["hometown"] == hometown
#         hometown_count << cont_values
#       end
#     end
#   end
#   return hometown_count.length
# end

#alternative count_contestants_by_hometown (using counter)
def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |s_num, contestants|
    contestants.each do |cont_keys, cont_values|
      if cont_keys["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end


def get_occupation(data, hometown)
  #returns the occupation of the first contestant who hails from that hometown
  #use the method that only returns first for whom the condition returns true = #find
  data.each do |s_num, contestants|
    contestants.each do |cont_keys, cont_values|
      if cont_keys["hometown"] == hometown
        return cont_keys["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # Iterate through the hash and return the average age of all of the contestants for that season
  # convert ages into integers
  # my preferred method, but failing somehow
  ages = []
  data.each do |s_num, contestants|
    if s_num == season
    contestants.each do |cont_keys, cont_values|
        ages << cont_keys["age"].to_i
      end
    end
  end
  average = (ages.sum / ages.size.to_f).round
end

# get_average_age_for_season(data, :"season 10")

# def get_average_age_for_season(data, season)
#   counter = 0
#   age_sum = 0
#   data.each do |s_num, contestants|
#     if s_num == season
#       contestants.each do |cont_keys, cont_values|
#         age_sum += cont_keys["age"].to_f
#         counter +=1
#       end
#     end
#   end
#   return (age_sum/counter).round
# end
