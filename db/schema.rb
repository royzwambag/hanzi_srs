# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_10_163854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "value"
    t.string "pinyin"
    t.string "english_translation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters_phrases", id: false, force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "phrase_id"
    t.index ["character_id"], name: "index_characters_phrases_on_character_id"
    t.index ["phrase_id"], name: "index_characters_phrases_on_phrase_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.string "value"
    t.string "pinyin"
    t.string "english_translation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "character_id"
    t.bigint "phrase_id"
    t.datetime "last_review"
    t.datetime "next_review"
    t.integer "correct_repetitions"
    t.decimal "easiness_factor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_reviews_on_character_id"
    t.index ["phrase_id"], name: "index_reviews_on_phrase_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
