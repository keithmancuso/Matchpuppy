class AddSubscribeToUser < ActiveRecord::Migration
  def up

     change_table :users do |t|
           t.boolean :subscribe, :default => true
       end
   end

   def down
     remove_column :users, :subscribe  

   end
end
