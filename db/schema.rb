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

ActiveRecord::Schema.define(version: 2019_02_25_101514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "scheduled_at"
    t.string "state", default: "Pending"
    t.string "description"
    t.string "photo"
    t.bigint "barber_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_id"], name: "index_appointments_on_barber_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "barbers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "languages"
    t.string "avatar"
    t.string "description"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_barbers_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name"
    t.string "owner_name"
    t.string "address"
    t.text "description"
    t.integer "open_at"
    t.integer "close_at"
    t.string "photo"
    t.string "url"
    t.string "phone_number"
    t.string "logo"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.integer "age"
    t.string "gender"
    t.string "address"
    t.string "languages"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "barbers"
  add_foreign_key "appointments", "users"
  add_foreign_key "barbers", "shops"
end
