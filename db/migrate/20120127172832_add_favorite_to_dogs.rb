class AddFavoriteToDogs < ActiveRecord::Migration
  def up
    add_column :dogs, :favorite, :text
    
  end
  def down
    remove_column :dogs, :favorite
    
  end
end
