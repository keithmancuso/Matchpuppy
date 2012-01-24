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

ActiveRecord::Schema.define(:version => 20120123182903) do

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
  end

  create_table "parks", :force => true do |t|
    t.string   "name"
    t.string   "borough"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playdate_guests", :force => true do |t|
    t.integer  "playdate_id"
    t.integer  "dog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playdate_guests", ["dog_id"], :name => "index_playdate_guests_on_dog_id"

  create_table "playdates", :force => true do |t|
    t.datetime "play_date"
    t.integer  "park_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
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
  end

  add_index "users", ["park_id"], :name => "index_users_on_park_id"

end
