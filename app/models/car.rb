class Car < ActiveRecord::Base
  
  
  def self.regexed_search (string)
    query_term = ""

    string.each_char do |char|
      query_term += '[#{char}|\*]'
    end
    
    Car.where('serial_number_pattern ~* ?', query_term)
    # Car.where('serial_number_pattern ~* ?', '[x|\*][x|\*][r|\*][c|\*][a|\*][v|\*][1|\*][2|\*][3|\*][4|\*][5|\*][6|\*]')
  end
end
