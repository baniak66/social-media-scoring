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

ActiveRecord::Schema.define(version: 20170520164500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email"], name: "index_clients_on_email", using: :btree
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "names_list"
    t.integer  "score"
    t.integer  "category_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_hashtags_on_category_id", using: :btree
    t.index ["client_id"], name: "index_hashtags_on_client_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.string   "names_list"
    t.integer  "score"
    t.integer  "category_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_likes_on_category_id", using: :btree
    t.index ["client_id"], name: "index_likes_on_client_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_schools_on_client_id", using: :btree
  end

  create_table "workplaces", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_workplaces_on_client_id", using: :btree
  end

  add_foreign_key "hashtags", "categories"
  add_foreign_key "hashtags", "clients"
  add_foreign_key "likes", "categories"
  add_foreign_key "likes", "clients"
  add_foreign_key "schools", "clients"
  add_foreign_key "workplaces", "clients"
end
