# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120207212212) do

  create_table "comments", :force => true do |t|
    t.integer  "playdate_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", :force => true do |t|
    t.string   "name"
    t.string   "size"
    t.string   "breed"
    t.string   "gender"
    t.string   "picture_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "avatar_updated_at"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.string   "avatar_file_name"
    t.text     "favorite"
    t.string   "energy"
    t.string   "modivation"
  end

  create_table "park_loves", :force => true do |t|
    t.integer  "park_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "park_loves", ["park_id"], :name => "index_park_loves_on_park_id"
  add_index "park_loves", ["user_id"], :name => "index_park_loves_on_user_id"

  create_table "parks", :force => true do |t|
    t.string   "name"
    t.string   "borough"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "park_type"
    t.string   "address"
    t.text     "description"
  end

  create_table "playdate_guests", :force => true do |t|
    t.integer  "playdate_id"
    t.integer  "dog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rsvp"
  end

  add_index "playdate_guests", ["dog_id"], :name => "index_playdate_guests_on_dog_id"

  create_table "playdates", :force => true do |t|
    t.integer  "park_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.datetime "play_date"
    t.time     "play_time"
    t.text     "description"
    t.datetime "play_at"
  end

  add_index "playdates", ["park_id"], :name => "index_playdates_on_park_id"
  add_index "playdates", ["user_id"], :name => "index_playdates_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "park_id"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token",  :default => "",       :null => false
    t.string   "user_type",         :default => "normal"
    t.boolean  "subscribe",         :default => true
  end

  add_index "users", ["park_id"], :name => "index_users_on_park_id"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
