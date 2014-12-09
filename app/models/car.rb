class Car < ActiveRecord::Base
  validates :serial_number_pattern, :trim_id, :year, :make, :model, :trim_name, presence: true
  validates :serial_number_pattern, length: { is: 12 }
  
  #TODO: belongs_to ... manufacturer? dealer? 
  #TODO: has_many ... previous_owners? transactions?
  
  def self.regexed_search (string)
    #TODO: this is a little long
    #this checking is really only needed for times when the user is directly typing in params to url bar
    pure_string = string.gsub(/[^a-zA-Z0-9 ]/,"")
    puts "1"
    #invalid chars
    if (pure_string.length == string.length)
      puts "2"
      #invalid length
      if (pure_string.length == 12)
        puts "3"
        temp_letters = pure_string[0..5]
        temp_letters = temp_letters.gsub(/[^a-zA-Z]/,"")
        puts "aaa"
        puts pure_string
        puts temp_letters
        #numbers in first 6 chars
        if (temp_letters.length == 6)
          puts "4"
          temp_letters_2 = pure_string[6..11].gsub(/[^0-9]/,"")
          #letters in last six chars
          if (temp_letters_2.length == 6)
            puts "5"
            #finally construct query and return the values
            query_term = ""
    
            string.each_char do |char|
              query_term += '[' + char.downcase + '|\*]'
            end
            
            #TODO: confirm that this way is not prone to sql injection
            return Car.where('serial_number_pattern ~* ?', query_term)
          end
        end
      end
    end
    
    return []  
    # Car.where('serial_number_pattern ~* ?', '[x|\*][x|\*][r|\*][c|\*][a|\*][v|\*][1|\*][2|\*][3|\*][4|\*][5|\*][6|\*]')
  end
end
