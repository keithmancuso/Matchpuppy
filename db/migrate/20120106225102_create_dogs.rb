class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :size
      t.string :breed
      t.string :gender
      t.string :picture_url
      t.references :user
      
      t.timestamps
    end
  end
end
