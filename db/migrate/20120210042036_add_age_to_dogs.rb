class AddAgeToDogs < ActiveRecord::Migration
  def up
    add_column :dogs, :age, :string 
  end

  def down
    remove_column :dogs, :age
  end
end
