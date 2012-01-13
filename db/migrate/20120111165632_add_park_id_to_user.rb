class AddParkIdToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
        t.references :park
      end
  end
end
