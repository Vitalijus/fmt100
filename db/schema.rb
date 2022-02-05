# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_05_102330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "odometers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "destination_address"
    t.string "origin_address"
    t.integer "distance"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "vehicle_id", null: false
    t.index ["vehicle_id"], name: "index_odometers_on_vehicle_id"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "vehicle_id", null: false
    t.string "phone_number"
    t.string "company_title"
    t.string "name"
    t.string "surname"
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "trackers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "altitude"
    t.string "angle"
    t.string "satellites"
    t.string "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "vehicle_id", null: false
    t.boolean "within_radius"
    t.string "city"
    t.integer "radius_size"
    t.float "radius_longitude"
    t.float "radius_latitude"
    t.index ["vehicle_id"], name: "index_trackers_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "manufacturer"
    t.string "model"
    t.string "plate_number"
    t.string "category"
    t.string "body_style"
    t.string "color"
    t.integer "year"
    t.integer "ad_size"
    t.integer "ad_duration"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tracker_imei"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "odometers", "vehicles"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "trackers", "vehicles"
  add_foreign_key "vehicles", "users"
end
