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

ActiveRecord::Schema[7.1].define(version: 2025_06_04_092834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "alerts", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.string "content"
    t.integer "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_alerts_on_flight_id"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  end

  create_table "flights", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "flight_number"
    t.string "airport"
    t.string "terminal"
    t.string "destination"
    t.datetime "takeoff_time"
    t.datetime "landing_time"
    t.string "user_departure_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration_second"
    t.integer "arrival_time_wanted"
    t.integer "mobility_choice"
    t.integer "estimated_wait"
    t.boolean "valise"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "done"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flight_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_tasks_on_category_id"
    t.index ["flight_id"], name: "index_tasks_on_flight_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alerts", "flights"
  add_foreign_key "flights", "users"
  add_foreign_key "tasks", "flights"
  add_foreign_key "tasks", "users"
end
