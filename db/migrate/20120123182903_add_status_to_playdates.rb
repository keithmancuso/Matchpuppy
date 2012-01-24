class AddStatusToPlaydates < ActiveRecord::Migration
  def change
    change_table :playdates do |t|
        t.string :status
    end
  end
end
