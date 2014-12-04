class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :serial_number_pattern, null: false
      t.integer :trim_id, null: false
      t.integer :year, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.string :trim_name, null: false

      t.timestamps
    end
    
    add_index :cars, :car_id
    add_index :cars, :serial_number_pattern
  end
end
