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

ActiveRecord::Schema.define(version: 2021_12_13_074136) do

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "chairtype"
    t.integer "theater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theater_id"], name: "index_chairs_on_theater_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "movietype"
    t.datetime "date_in"
    t.datetime "date_out"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "beverage_id", null: false
    t.integer "inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beverage_id"], name: "index_products_on_beverage_id"
    t.index ["inventory_id"], name: "index_products_on_inventory_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "timetable_id", null: false
    t.integer "chair_id", null: false
    t.integer "inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chair_id"], name: "index_tickets_on_chair_id"
    t.index ["inventory_id"], name: "index_tickets_on_inventory_id"
    t.index ["timetable_id"], name: "index_tickets_on_timetable_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.datetime "time_start"
    t.datetime "time_stop"
    t.integer "movie_id", null: false
    t.integer "theater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_timetables_on_movie_id"
    t.index ["theater_id"], name: "index_timetables_on_theater_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chairs", "theaters"
  add_foreign_key "inventories", "users"
  add_foreign_key "products", "beverages"
  add_foreign_key "products", "inventories"
  add_foreign_key "tickets", "chairs"
  add_foreign_key "tickets", "inventories"
  add_foreign_key "tickets", "timetables"
  add_foreign_key "timetables", "movies"
  add_foreign_key "timetables", "theaters"
end
