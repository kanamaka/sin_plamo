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

ActiveRecord::Schema.define(version: 2021_11_24_115701) do

  create_table "alarms", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "opu_id"
    t.integer "comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "question_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_answers_on_customer_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.integer "content_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.string "parts"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "customer_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opu_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opus_id"
    t.string "profile_image_id"
    t.string "profile"
    t.string "content_image_id"
    t.string "image_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "opu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "opu_id"], name: "index_favorites_on_customer_id_and_opu_id", unique: true
  end

  create_table "friends", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "followed_id"
    t.index ["customer_id", "follower_id"], name: "index_friends_on_customer_id_and_follower_id", unique: true
    t.index ["customer_id"], name: "index_friends_on_customer_id"
    t.index ["follower_id"], name: "index_friends_on_follower_id"
  end

  create_table "opus", force: :cascade do |t|
    t.integer "tag"
    t.string "opus_name"
    t.text "opus_explanation"
    t.string "opus_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.string "customer_id"
    t.string "image"
    t.string "name"
    t.string "profile"
  end

  create_table "opus_images", force: :cascade do |t|
    t.integer "opu_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_id"
    t.string "opus_image_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "question_time"
    t.integer "content_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

  create_table "tag_relationships", force: :cascade do |t|
    t.integer "opu_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opu_id", "tag_id"], name: "index_tag_relationships_on_opu_id_and_tag_id", unique: true
    t.index ["opu_id"], name: "index_tag_relationships_on_opu_id"
    t.index ["tag_id"], name: "index_tag_relationships_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
