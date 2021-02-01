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

ActiveRecord::Schema.define(version: 2021_02_01_015341) do

  create_table "receptions", force: :cascade do |t|
    t.integer "viewing_time_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "viewing_time_id"], name: "index_receptions_on_user_id_and_viewing_time_id", unique: true
    t.index ["user_id"], name: "index_receptions_on_user_id"
    t.index ["viewing_time_id"], name: "index_receptions_on_viewing_time_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "viewing_time_id"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["viewing_time_id"], name: "index_users_on_viewing_time_id"
  end

  create_table "viewing_times", force: :cascade do |t|
    t.date "hold_at", null: false
    t.string "program_name", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hold_at", "program_name"], name: "index_viewing_times_on_hold_at_and_program_name", unique: true
  end

end
