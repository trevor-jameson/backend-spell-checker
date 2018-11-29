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

ActiveRecord::Schema.define(version: 2018_11_28_234122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities_sets", force: :cascade do |t|
    t.bigint "char_id"
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.index ["char_id"], name: "index_abilities_sets_on_char_id", unique: true
  end

  create_table "char_klasses", force: :cascade do |t|
    t.bigint "char_id"
    t.bigint "klass_id"
    t.integer "klass_lvl"
    t.index ["char_id"], name: "index_char_klasses_on_char_id"
    t.index ["klass_id"], name: "index_char_klasses_on_klass_id"
  end

  create_table "chars", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "health"
    t.text "notes"
    t.index ["user_id"], name: "index_chars_on_user_id"
  end

  create_table "klass_levels", force: :cascade do |t|
    t.bigint "klass_id"
    t.integer "spellscanknow"
    t.integer "level"
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
    t.index ["klass_id"], name: "index_klass_levels_on_klass_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "api_id"
    t.string "name"
    t.integer "hitdie"
  end

  create_table "known_spells", force: :cascade do |t|
    t.bigint "spell_id"
    t.bigint "char_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["char_id"], name: "index_known_spells_on_char_id"
    t.index ["spell_id"], name: "index_known_spells_on_spell_id"
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

  add_foreign_key "abilities_sets", "chars"
  add_foreign_key "char_klasses", "chars"
  add_foreign_key "char_klasses", "klasses"
  add_foreign_key "chars", "users"
  add_foreign_key "klass_levels", "klasses"
  add_foreign_key "known_spells", "chars"
  add_foreign_key "known_spells", "spells"
end
