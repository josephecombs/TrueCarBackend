class Car < ActiveRecord::Base
  validates :serial_number_pattern, :trim_id, :year, :make, :model, :trim_name, presence: true
  validates :serial_number_pattern, length: { is: 12 }
  
  #TODO: belongs_to ... manufacturer? dealer? 
  #TODO: has_many ... previous_owners? transactions?
  
  def self.regexed_search (string)
    query_term = ""
    
    string.each_char do |char|
      query_term += '[' + char.downcase + '|\*]'
    end
    
    #TODO: confirm that this way is not prone to sql injection
    Car.where('serial_number_pattern ~* ?', query_term)
    # Car.where('serial_number_pattern ~* ?', '[x|\*][x|\*][r|\*][c|\*][a|\*][v|\*][1|\*][2|\*][3|\*][4|\*][5|\*][6|\*]')
  end
end
