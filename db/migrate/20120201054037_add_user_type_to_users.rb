class AddUserTypeToUsers < ActiveRecord::Migration
  def up
    
    change_table :users do |t|
          t.string :user_type, :default => "normal"
      end
  end
  
  def down
    remove_column :users, :user_type  
    
  end
  
end
