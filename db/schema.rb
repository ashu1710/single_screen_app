# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_23_170952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_attendances", force: :cascade do |t|
    t.date "present_date"
    t.binary "picture"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_attendances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.float "latitude"
    t.float "longitude"
    t.string "country"
    t.string "state"
    t.string "area"
    t.integer "pincode"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_attendances", "users"
end
