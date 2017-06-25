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

ActiveRecord::Schema.define(version: 20170625033011) do

  create_table "mobiles", force: :cascade do |t|
    t.integer  "uid"
    t.datetime "signup_dt"
    t.string   "auth_type"
    t.integer  "device"
    t.datetime "dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unemployments", force: :cascade do |t|
    t.decimal  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end