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

ActiveRecord::Schema[7.1].define(version: 2025_03_17_144907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concerts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "genre"
    t.date "date"
    t.string "localisation"
    t.integer "public"
    t.string "venue"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_concerts_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "concert_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_contents_on_concert_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.boolean "status"
    t.bigint "concert_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_participations_on_concert_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "content_id", null: false
    t.index ["content_id"], name: "index_reviews_on_content_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "contribution"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "concerts", "users"
  add_foreign_key "contents", "concerts"
  add_foreign_key "contents", "users"
  add_foreign_key "participations", "concerts"
  add_foreign_key "participations", "users"
  add_foreign_key "reviews", "contents"
  add_foreign_key "reviews", "users"
end
