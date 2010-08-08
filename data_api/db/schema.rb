# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100807232802) do

  create_table "configurations", :force => true do |t|
    t.string   "query_base"
    t.string   "query_where"
    t.string   "data_field_names"
    t.string   "data_field_friendly_name"
    t.string   "filter_field_name"
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websites", :force => true do |t|
    t.string "name"
    t.string "label"
    t.text   "value"
  end

  add_index "websites", ["id"], :name => "sqlite_autoindex_websites_1", :unique => true

end
