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

ActiveRecord::Schema.define(version: 2021_06_11_020349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rounds", force: :cascade do |t|
    t.integer "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color"], name: "index_rounds_on_color"
  end

  create_table "user_rounds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "round_id", null: false
    t.integer "color"
    t.decimal "amount", precision: 19, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color"], name: "index_user_rounds_on_color"
    t.index ["round_id"], name: "index_user_rounds_on_round_id"
    t.index ["user_id"], name: "index_user_rounds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.decimal "balance", precision: 19, scale: 2, default: "10000.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.date "date"
    t.float "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_weathers_on_date", unique: true
  end

  add_foreign_key "user_rounds", "rounds"
  add_foreign_key "user_rounds", "users"
end
