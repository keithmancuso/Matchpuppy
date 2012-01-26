class AddRsvpToPlaydateGuests < ActiveRecord::Migration
  def change
    change_table :playdate_guests do |t|
        t.string :rsvp
    end
  end
end
