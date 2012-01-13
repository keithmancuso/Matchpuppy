class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
      t.datetime :play_date
      t.integer :park_id
      t.integer :user_id

      t.timestamps
    end
    add_index :playdates, :park_id
    add_index :playdates, :user_id
    
  end
end
