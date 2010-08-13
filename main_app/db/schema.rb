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

ActiveRecord::Schema.define(:version => 20100812213117) do

  create_table "hosts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin_datas", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "plugin_configuration_id"
    t.integer  "repository_id"
    t.string   "field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pluginconfigurations", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "plugin_description_id"
    t.integer  "repository_id"
    t.string   "field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugindefinitions", :force => true do |t|
    t.integer  "plugin_id"
    t.string   "field_name"
    t.string   "field_data_type"
    t.string   "field_visual_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "uri"
    t.string   "path"
    t.integer  "plugin_id",   :limit => 255
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
  end

  create_table "repositories_roles", :id => false, :force => true do |t|
    t.integer "repository_id"
    t.integer "role_id"
  end

  create_table "repositories_users", :id => false, :force => true do |t|
    t.integer "repository_id"
    t.integer "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

  create_table "websites", :force => true do |t|
    t.string "name"
    t.string "label"
    t.text   "value"
  end

end
