class AddDescriptionToPlaydate < ActiveRecord::Migration
  def change
    change_table :playdates do |t|
        t.text :description
    end
  end
end
