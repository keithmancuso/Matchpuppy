class AddParkIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :park_id
  end
end
