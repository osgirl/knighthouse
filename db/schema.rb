# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120825203238) do

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "old_id"
    t.string   "phone"
    t.datetime "date_of_birth"
    t.integer  "weight"
    t.integer  "height"
    t.string   "referrer_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "clients", ["old_id"], :name => "index_clients_on_old_id", :unique => true

  create_table "delivery_point_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventory_items", :force => true do |t|
    t.integer  "old_item_id"
    t.integer  "item_type_id"
    t.integer  "current_location_id"
    t.integer  "inventory_count",     :default => 1
    t.decimal  "cost_per_day",        :default => 0.0
    t.decimal  "max_cost",            :default => 0.0
    t.decimal  "actual_cost",         :default => 0.0
    t.datetime "age_start_date"
    t.datetime "date_received"
    t.boolean  "is_retired",          :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "inventory_items", ["old_item_id"], :name => "index_inventory_items_on_old_item_id", :unique => true

  create_table "item_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_types", ["name"], :name => "index_item_types_on_name", :unique => true

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "location_hash"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "locations", ["location_hash"], :name => "index_locations_on_location_hash", :unique => true

  create_table "order_item_lines", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_type_id"
    t.integer  "inventory_item_id"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "location_id"
    t.integer  "client_id"
    t.string   "alternate_phone"
    t.text     "directions"
    t.integer  "delivery_point_type_id"
    t.integer  "delivery_type"
    t.float    "miles"
    t.integer  "time"
    t.datetime "scheduled_delivery_date"
    t.integer  "status"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "contact_id"
    t.string   "referrer_name"
    t.string   "delivery_point_detail"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",  :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "name"
    t.string   "roles_mask",             :default => "0"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "invitation_token"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
