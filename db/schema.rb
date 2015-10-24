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

ActiveRecord::Schema.define(version: 20151024114011) do

  create_table "comments", force: :cascade do |t|
    t.string   "belongs_to"
    t.integer  "toilet_id"
    t.string   "has_one"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toilets", force: :cascade do |t|
    t.string   "extractdate"
    t.string   "organisationlabel"
    t.string   "locationtext"
    t.string   "coordinatereferencesystem", default: "WGS84"
    t.float    "geox"
    t.float    "geoy"
    t.string   "category"
    t.string   "babychange"
    t.string   "familytoilet"
    t.string   "changingplace"
    t.string   "fulltimestaffing"
    t.string   "chargeamount"
    t.string   "openinghours"
    t.string   "managedby"
    t.string   "reportemail"
    t.string   "reporttel"
    t.string   "postcode"
    t.string   "streetaddress"
    t.string   "radarkeyneeded"
    t.integer  "rating",                    default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "toilet_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
