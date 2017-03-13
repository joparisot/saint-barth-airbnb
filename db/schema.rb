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

ActiveRecord::Schema.define(version: 20170313161340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "villa_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "number_of_guests"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
    t.index ["villa_id"], name: "index_bookings_on_villa_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "date_of_birth"
    t.string   "gender"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "villas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "price"
    t.integer  "number_of_guests"
    t.integer  "number_of_beds"
    t.string   "category"
    t.boolean  "pool"
    t.boolean  "heated_pool"
    t.integer  "number_of_bathrooms"
    t.integer  "number_of_rooms"
    t.time     "arrival_time"
    t.boolean  "jacuzzi"
    t.boolean  "parking"
    t.boolean  "wifi"
    t.boolean  "smoking_allowed"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "address"
    t.index ["user_id"], name: "index_villas_on_user_id", using: :btree
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "villas"
  add_foreign_key "villas", "users"
end
