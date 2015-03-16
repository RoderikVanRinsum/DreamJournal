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

ActiveRecord::Schema.define(version: 20150316111128) do

  create_table "dream_dreamsigns", force: :cascade do |t|
    t.integer  "dream_id"
    t.integer  "dreamsign_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "dream_dreamsigns", ["dream_id"], name: "index_dream_dreamsigns_on_dream_id"
  add_index "dream_dreamsigns", ["dreamsign_id"], name: "index_dream_dreamsigns_on_dreamsign_id"

  create_table "dreams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "lucid"
  end

  create_table "dreamsigns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
