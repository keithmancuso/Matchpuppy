class AddPlayAtToPlaydate < ActiveRecord::Migration
  def up

     change_table :playdates do |t|
           t.timestamp :play_at
       end
   end

   def down
     remove_column :playdates, :play_at  

   end
end
