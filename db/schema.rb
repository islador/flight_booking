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

ActiveRecord::Schema.define(:version => 20131115203216) do

  create_table "agents", :force => true do |t|
    t.integer  "reservation_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "airlines", :force => true do |t|
    t.string   "name"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "airp_airls", :force => true do |t|
    t.integer  "airport_id"
    t.integer  "airline_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "airp_airls", ["airline_id"], :name => "index_airp_airls_on_airline_id"
  add_index "airp_airls", ["airport_id", "airline_id"], :name => "index_airp_airls_on_airport_id_and_airline_id", :unique => true
  add_index "airp_airls", ["airport_id"], :name => "index_airp_airls_on_airport_id"

  create_table "airports", :force => true do |t|
    t.string   "i_code"
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "client_id"
    t.integer  "number"
    t.integer  "cvv2"
    t.date     "expiration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flight_reservations", :force => true do |t|
    t.integer  "flight_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flight_reservations", ["flight_id", "reservation_id"], :name => "index_flight_reservations_on_flight_id_and_reservation_id", :unique => true
  add_index "flight_reservations", ["flight_id"], :name => "index_flight_reservations_on_flight_id"
  add_index "flight_reservations", ["reservation_id"], :name => "index_flight_reservations_on_reservation_id"

  create_table "flights", :force => true do |t|
    t.integer  "airline_id"
    t.integer  "number"
    t.date     "date"
    t.datetime "departure"
    t.datetime "arrival"
    t.integer  "origin_airport"
    t.integer  "destination_airport"
    t.integer  "plane_id"
    t.integer  "bus_fare"
    t.integer  "eco_fare"
    t.integer  "bus_avail"
    t.integer  "eco_avail"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "frequent_flier_clients", :force => true do |t|
    t.integer  "frequentflier_id"
    t.integer  "client_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "frequent_flier_clients", ["client_id"], :name => "index_frequent_flier_clients_on_client_id"
  add_index "frequent_flier_clients", ["frequentflier_id", "client_id"], :name => "index_frequent_flier_clients_on_frequentflier_id_and_client_id", :unique => true
  add_index "frequent_flier_clients", ["frequentflier_id"], :name => "index_frequent_flier_clients_on_frequentflier_id"

  create_table "frequent_fliers", :force => true do |t|
    t.integer  "airline_id"
    t.integer  "discount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "planes", :force => true do |t|
    t.string   "manufacturer"
    t.string   "prop_type"
    t.integer  "bus_cap"
    t.integer  "eco_cap"
    t.integer  "tail_num"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "preferences", :force => true do |t|
    t.integer  "client_id"
    t.string   "location"
    t.string   "seat"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "client_id"
    t.integer  "payment_source"
    t.integer  "status"
    t.integer  "preference_id"
    t.integer  "frequentflier_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end