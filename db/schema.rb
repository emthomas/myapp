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

ActiveRecord::Schema.define(version: 20150715021447) do

  create_table "families", force: :cascade do |t|
    t.string   "family_name",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "member_count", limit: 4
  end

  add_index "families", ["family_name"], name: "index_families_on_family_name", unique: true, using: :btree

  create_table "guess_who_questions", force: :cascade do |t|
    t.string   "question",   limit: 255
    t.string   "answer",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "guess_who_user_answers", force: :cascade do |t|
    t.integer  "guess_who_question_id", limit: 4
    t.integer  "user_id",               limit: 4
    t.string   "answer",                limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "guess_who_user_answers", ["guess_who_question_id"], name: "fk_rails_83adc8c345", using: :btree
  add_index "guess_who_user_answers", ["user_id"], name: "index_guess_who_user_answers_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "subject",     limit: 255
    t.text     "body",        limit: 65535
    t.integer  "user_id",     limit: 4
    t.boolean  "new_message", limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
  end

  add_index "messages", ["new_message"], name: "index_messages_on_new_message", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "table_id",   limit: 4
    t.integer  "theme",      limit: 4,   default: 0
    t.string   "url",        limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "pictures", ["table_id"], name: "index_pictures_on_table_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "song_requests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "author",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "song_requests", ["user_id"], name: "index_song_requests_on_user_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "number",     limit: 4, default: -1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "capacity",   limit: 4, default: 15
  end

  add_index "tables", ["number"], name: "index_tables_on_number", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",        limit: 50
    t.string   "last_name",         limit: 50
    t.string   "username",          limit: 100
    t.string   "email",             limit: 100
    t.string   "address",           limit: 255
    t.boolean  "admin",             limit: 1,   default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "invited",           limit: 1,   default: false
    t.boolean  "is_coming",         limit: 1,   default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",         limit: 1,   default: false
    t.datetime "activated_at"
    t.integer  "family_id",         limit: 4
    t.boolean  "is_adult",          limit: 1,   default: true
    t.integer  "logins",            limit: 4,   default: 0
    t.date     "last_login"
    t.integer  "table_id",          limit: 4
    t.integer  "theme",             limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["family_id"], name: "index_users_on_family_id", using: :btree
  add_index "users", ["last_name", "first_name"], name: "index_users_on_last_first", unique: true, using: :btree
  add_index "users", ["table_id"], name: "index_users_on_table_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "guess_who_user_answers", "guess_who_questions"
  add_foreign_key "guess_who_user_answers", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "pictures", "tables"
  add_foreign_key "song_requests", "users"
  add_foreign_key "users", "families"
  add_foreign_key "users", "families"
  add_foreign_key "users", "tables"
end
