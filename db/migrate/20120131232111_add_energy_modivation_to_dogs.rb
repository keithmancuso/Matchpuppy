class AddEnergyModivationToDogs < ActiveRecord::Migration
  def change
    
     change_table :dogs do |t|
          t.string :energy
          t.string :modivation
      end
  end
end
