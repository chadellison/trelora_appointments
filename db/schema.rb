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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160613235121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.string   "status"
    t.integer  "location_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "field_worker_id"
    t.datetime "end_time"
    t.string   "description"
  end

  add_index "appointments", ["location_id"], name: "index_appointments_on_location_id", using: :btree

  create_table "field_workers", force: :cascade do |t|
    t.string   "username"
    t.string   "icon"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "role"
    t.integer  "trelora_id"
    t.string   "status",     default: "active"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "profile"
    t.string   "password"
  end

  add_foreign_key "appointments", "locations"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
