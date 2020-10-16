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

ActiveRecord::Schema.define(version: 2020_09_17_013251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_days_on_date", unique: true
  end

  create_table "followings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "asset_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id", "user_id"], name: "index_followings_on_asset_id_and_user_id", unique: true
    t.index ["asset_id"], name: "index_followings_on_asset_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "headlines", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id", "day_id"], name: "index_headlines_on_asset_id_and_day_id", unique: true
    t.index ["asset_id"], name: "index_headlines_on_asset_id"
    t.index ["day_id"], name: "index_headlines_on_day_id"
  end

  create_table "news", force: :cascade do |t|
    t.bigint "headline_id", null: false
    t.string "title"
    t.text "description"
    t.string "link"
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_news_on_author_id"
    t.index ["headline_id"], name: "index_news_on_headline_id"
  end

  create_table "prices", force: :cascade do |t|
    t.float "value"
    t.float "change"
    t.bigint "day_id", null: false
    t.bigint "asset_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_prices_on_asset_id"
    t.index ["day_id", "asset_id"], name: "index_prices_on_day_id_and_asset_id", unique: true
    t.index ["day_id"], name: "index_prices_on_day_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "followings", "assets"
  add_foreign_key "followings", "users"
  add_foreign_key "headlines", "assets"
  add_foreign_key "headlines", "days"
  add_foreign_key "news", "authors"
  add_foreign_key "news", "headlines"
  add_foreign_key "prices", "assets"
  add_foreign_key "prices", "days"
end
