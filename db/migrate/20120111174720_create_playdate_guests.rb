class CreatePlaydateGuests < ActiveRecord::Migration
  def change
    create_table :playdate_guests do |t|
      t.integer :playdate_id
      t.integer :dog_id

      t.timestamps
    end
    add_index :playdate_guests, :dog_id
    
    
  end
end
