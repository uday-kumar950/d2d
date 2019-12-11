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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191207194139) do

  create_table "service_trips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "vehicle_id"
    t.date "travel_date"
    t.boolean "running_status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id", "travel_date"], name: "service_trips_vehicle_travel_date"
    t.index ["vehicle_id"], name: "index_service_trips_on_vehicle_id"
  end

  create_table "vehicle_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "service_trip_id"
    t.bigint "vehicle_id"
    t.decimal "lat", precision: 15, scale: 10, default: "0.0"
    t.decimal "lng", precision: 15, scale: 10, default: "0.0"
    t.datetime "at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_trip_id"], name: "index_vehicle_locations_on_service_trip_id"
    t.index ["vehicle_id", "service_trip_id"], name: "vehicle_locations_vehicle_service_trip"
    t.index ["vehicle_id"], name: "index_vehicle_locations_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uuid"
    t.boolean "regd_status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "service_trips", "vehicles"
  add_foreign_key "vehicle_locations", "service_trips"
  add_foreign_key "vehicle_locations", "vehicles"
end
