class ChangePlaydateToDatetime < ActiveRecord::Migration
  def up
    change_table :playdates do |t|
          t.change :play_date, :datetime
     end
  end

  def down
      change_table :playdates do |t|
            t.change :play_date, :date
       end
  end
end
