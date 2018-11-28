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

ActiveRecord::Schema.define(version: 2018_11_28_152929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities_sets", force: :cascade do |t|
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
  end

  create_table "char_klasses", force: :cascade do |t|
    t.bigint "char_id"
    t.bigint "klass_id"
    t.index ["char_id"], name: "index_char_klasses_on_char_id"
    t.index ["klass_id"], name: "index_char_klasses_on_klass_id"
  end

  create_table "chars", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "abilities_set_id"
    t.string "school"
    t.text "notes"
    t.index ["abilities_set_id"], name: "index_chars_on_abilities_set_id"
    t.index ["user_id"], name: "index_chars_on_user_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "api_id"
    t.string "name"
    t.integer "hitdie"
  end

  create_table "known_spells", force: :cascade do |t|
    t.bigint "spells_id"
    t.bigint "chars_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chars_id"], name: "index_known_spells_on_chars_id"
    t.index ["spells_id"], name: "index_known_spells_on_spells_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "api_id"
    t.integer "asbonus"
    t.string "features"
    t.integer "profbonus"
  end

  create_table "spell_slots", force: :cascade do |t|
    t.bigint "klass_id"
    t.bigint "level_id"
    t.integer "slot0"
    t.integer "slot1"
    t.integer "slot2"
    t.integer "slot3"
    t.integer "slot4"
    t.integer "slot5"
    t.integer "slot6"
    t.integer "slot7"
    t.integer "slot8"
    t.integer "slot9"
    t.index ["klass_id"], name: "index_spell_slots_on_klass_id"
    t.index ["level_id"], name: "index_spell_slots_on_level_id"
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

  add_foreign_key "char_klasses", "chars"
  add_foreign_key "char_klasses", "klasses"
  add_foreign_key "chars", "abilities_sets"
  add_foreign_key "chars", "users"
  add_foreign_key "known_spells", "chars", column: "chars_id"
  add_foreign_key "known_spells", "spells", column: "spells_id"
  add_foreign_key "spell_slots", "klasses"
  add_foreign_key "spell_slots", "levels"
end
