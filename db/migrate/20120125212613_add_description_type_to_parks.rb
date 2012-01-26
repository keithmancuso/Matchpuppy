class AddDescriptionTypeToParks < ActiveRecord::Migration
  
  def up
    
    add_column :parks, :park_type, :string
    add_column :parks, :address, :string
    add_column :parks, :description, :text
    
    
  end

  def down
     remove_column :parks, :park_type
     remove_column :parks, :address
     remove_column :parks, :description
  end
end
