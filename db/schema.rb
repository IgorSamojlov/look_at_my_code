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

ActiveRecord::Schema.define(version: 2020_05_31_110043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codes", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "permalink", null: false
    t.text "code", null: false
    t.bigint "syntax_id", null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "formatted_code", null: false
    t.index ["permalink"], name: "index_codes_on_permalink", unique: true
    t.index ["syntax_id"], name: "index_codes_on_syntax_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "line", null: false
    t.string "author"
    t.bigint "code_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code_id"], name: "index_comments_on_code_id"
  end

  create_table "syntaxes", force: :cascade do |t|
    t.string "name", null: false
    t.string "lang"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_syntaxes_on_name", unique: true
  end

  add_foreign_key "codes", "syntaxes"
  add_foreign_key "comments", "codes"
end
