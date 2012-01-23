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

ActiveRecord::Schema.define(:version => 20120123052253) do

  create_table "movies", :force => true do |t|
    t.integer  "netflix_id"
    t.integer  "length"
    t.integer  "ratings_count",       :default => 0, :null => false
    t.date     "release_at"
    t.string   "release_at_accuracy"
    t.string   "title",                              :null => false
    t.text     "description"
    t.string   "mpaa_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["netflix_id"], :name => "index_movies_on_netflix_id", :unique => true
  add_index "movies", ["title"], :name => "index_movies_on_title"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "movie_id",   :null => false
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secrets", :force => true do |t|
    t.string "key"
    t.string "value"
  end

  create_table "users", :force => true do |t|
    t.integer  "facebook_uid"
    t.integer  "ratings_count", :default => 0, :null => false
    t.string   "name",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["facebook_uid"], :name => "index_users_on_facebook_uid", :unique => true

end
