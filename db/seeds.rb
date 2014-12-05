# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# t.text :serial_number_pattern, null: false
# t.integer :trim_id, null: false
# t.integer :year, null: false
# t.string :make, null: false
# t.string :model, null: false
# t.string :trim_name, null: false
require 'csv'

CSV.foreach('db/vsn_data_noheader.csv') do |row|
  Car.create!({
    serial_number_pattern: row[0],
    trim_id: row[1],
    year: row[2],        
    make: row[3],
    model: row[4],
    trim_name: row[5]
  })
end