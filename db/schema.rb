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

ActiveRecord::Schema.define(version: 20151214213141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "doc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pet_id"
  end

  add_index "documents", ["pet_id"], name: "index_documents_on_pet_id", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "dob"
    t.date     "last_rabies"
    t.date     "last_tick"
    t.date     "last_heartworm"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "dog_pic_file_name"
    t.string   "dog_pic_content_type"
    t.integer  "dog_pic_file_size"
    t.datetime "dog_pic_updated_at"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "documents", "pets"
  add_foreign_key "pets", "users"
end
