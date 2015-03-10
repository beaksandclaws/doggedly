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

ActiveRecord::Schema.define(version: 20150310061803) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.boolean  "active",        limit: 1
    t.integer  "city_id",       limit: 4
    t.boolean  "alcohol",       limit: 1
    t.text     "location_info", limit: 65535
    t.text     "hours",         limit: 65535
    t.text     "how_enter",     limit: 65535
    t.boolean  "food",          limit: 1
    t.boolean  "waterbowl",     limit: 1
    t.text     "useful_tips",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "email",      limit: 255
    t.boolean  "active",     limit: 1
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "places", "cities"
end
