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
  sum = 0
  
  age_sum = data[season].collect{|contestant_info| sum += contestant_info["age"].to_i}.last 
  average_age = (age_sum/num_contestants.to_f).round 
  return average_age 

end
