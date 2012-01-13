class AddAvatarColumnsToDog < ActiveRecord::Migration
  def self.up
      change_table :dogs do |t|
        t.has_attached_file :avatar
      end
    end

    def self.down
      drop_attached_file :dogs, :avatar
    end
end
