require 'pry'

def get_first_name_of_season_winner(data, season)
  #data[season].find{|candidate_info| candidate_info["status"] == "Winner"}["name"].split.first 
  
  data[season].each do |contestant_info|
    if contestant_info["status"] == "Winner"
      return contestant_info["name"].split(" ")[0]
    end
  end 
end

def get_contestant_name(data, occupation)
  #data.each.find{|contestant_info| contestant_info["occupation"] == occupation}["name"]
  
  data.each do |season, contestants_hash|
    contestants_hash.find do |contestant| 
      if contestant["occupation"] == occupation
        return contestant["name"]
     end 
    end
  end 
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestants_hash|
    contestants_hash.each do |contestant|
      if contestant["hometown"] == hometown 
        count += 1 
      end 
    end 
  end 
  count 
end

def get_occupation(data, hometown)
  data.each do |season, contestants_hash|
    contestants_hash.find do |contestant|
      if contestant["hometown"] == hometown 
        return contestant["occupation"]
      end 
    end 
  end 
end

def get_average_age_for_season(data, season)
  num_contestants = data[season].length                          
  age_sum = 0 
  age_average = age_sum/num_contestants
  
  data[season].each do |contestant_info|
    age_sum += contestant_info["age"].to_i
    age_sum 
  end 
  age_average 
end
