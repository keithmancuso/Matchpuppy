class CreateParkLoves < ActiveRecord::Migration
  def change
    create_table :park_loves do |t|
      t.integer :park_id
      t.integer :user_id

      t.timestamps
    end
    add_index :park_loves, :park_id
    add_index :park_loves, :user_id
  end
end
