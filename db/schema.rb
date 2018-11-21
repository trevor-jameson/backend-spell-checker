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

ActiveRecord::Schema.define(version: 2018_11_18_205417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chars", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "klass"
    t.integer "lvl"
    t.string "school"
    t.text "notes"
  end

  create_table "known_spells", force: :cascade do |t|
    t.integer "spell_id"
    t.integer "char_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "api_id"
    t.integer "api_index"
    t.string "name"
    t.text "desc"
    t.text "highlvl"
    t.string "page"
    t.string "range"
    t.string "components"
    t.boolean "ritual"
    t.boolean "concentration"
    t.string "duration"
    t.string "castingtime"
    t.string "material"
    t.integer "lvl"
    t.string "school"
    t.string "classes"
    t.string "url"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.string "pic"
  end

end
