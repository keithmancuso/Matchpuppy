class ChangeDatetimeToTwoFieldsInPlaydate < ActiveRecord::Migration
  def up
    remove_column :playdates, :play_date
    add_column :playdates, :play_date, :date
    add_column :playdates, :play_time, :time
    
    
  end

  def down
     remove_column :playdates, :play_date
      remove_column :playdates, :play_time
    add_column :playdates, :play_date, :datetime
   
    
  end
end
