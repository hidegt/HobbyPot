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

ActiveRecord::Schema.define(version: 2020_11_13_033109) do

  create_table "circle_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_comments_on_circle_id"
    t.index ["user_id"], name: "index_circle_comments_on_user_id"
  end

  create_table "circles", force: :cascade do |t|
    t.integer "leader_id", null: false
    t.string "circle_title", null: false
    t.string "image_id", null: false
    t.text "circle_about", null: false
    t.datetime "date_and_time", null: false
    t.text "schedule", null: false
    t.text "prepare", null: false
    t.string "join_cost", null: false
    t.string "number_people", null: false
    t.boolean "circle_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postcode"
    t.string "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_circles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "circle_id"
    t.integer "join_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaders", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "circle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture_id"
    t.text "introduction"
    t.string "leader_image_id"
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_leaders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_leaders_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture_id"
    t.text "introduction"
    t.string "user_image_id"
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
