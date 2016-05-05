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

ActiveRecord::Schema.define(version: 20160505083839) do

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.string   "picture_comment"
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "comments", ["status_id"], name: "index_comments_on_status_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "admin_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "picture_micropost"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "pitches", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "quantity"
    t.string   "image"
    t.boolean  "rent_shoes"
    t.boolean  "rent_ball"
    t.boolean  "rent_kit"
    t.boolean  "have_lamp"
    t.integer  "cost"
    t.float    "lat"
    t.float    "lng"
    t.string   "county"
    t.float    "rating"
    t.text     "description"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pitches", ["user_id", "created_at"], name: "index_pitches_on_user_id_and_created_at"
  add_index "pitches", ["user_id"], name: "index_pitches_on_user_id"

  create_table "statuses", force: :cascade do |t|
    t.string   "content"
    t.string   "picture_status"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "statuses", ["group_id"], name: "index_statuses_on_group_id"
  add_index "statuses", ["user_id", "created_at"], name: "index_statuses_on_user_id_and_created_at"
  add_index "statuses", ["user_id"], name: "index_statuses_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "county"
    t.string   "photo"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teams", ["user_id", "created_at"], name: "index_teams_on_user_id_and_created_at"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "role",            default: 0
    t.string   "picture"
  end

end
