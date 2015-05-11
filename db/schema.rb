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

ActiveRecord::Schema.define(version: 20150511083834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "courts", force: :cascade do |t|
    t.string   "name"
    t.integer  "stadium_id"
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "change_price", precision: 8, scale: 2
  end

  add_index "courts", ["stadium_id"], name: "index_courts_on_stadium_id", using: :btree

  create_table "deposits", force: :cascade do |t|
    t.integer  "wallet_id"
    t.integer  "status"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "deposits", ["wallet_id"], name: "index_deposits_on_wallet_id", using: :btree

  create_table "event_changes", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
    t.string   "summary"
  end

  add_index "event_changes", ["event_id"], name: "index_event_changes_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "description"
    t.integer  "court_id"
    t.integer  "order_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "recurrence_rule"
    t.string   "recurrence_exception"
    t.integer  "recurrence_id"
    t.boolean  "is_all_day"
  end

  add_index "events", ["court_id"], name: "index_events_on_court_id", using: :btree
  add_index "events", ["order_id"], name: "index_events_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total",      precision: 8, scale: 2
    t.integer  "status"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "special_prices", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "price"
    t.boolean  "is_sale"
    t.integer  "court_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "special_prices", ["court_id"], name: "index_special_prices_on_court_id", using: :btree

  create_table "stadia", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stadia", ["category_id"], name: "index_stadia_on_category_id", using: :btree
  add_index "stadia", ["user_id"], name: "index_stadia_on_user_id", using: :btree

  create_table "stadiums", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
  end

  add_index "stadiums", ["category_id"], name: "index_stadiums_on_category_id", using: :btree
  add_index "stadiums", ["user_id"], name: "index_stadiums_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

  create_table "withdrawals", force: :cascade do |t|
    t.integer  "wallet_id"
    t.integer  "status"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "withdrawals", ["wallet_id"], name: "index_withdrawals_on_wallet_id", using: :btree

  add_foreign_key "courts", "stadiums"
  add_foreign_key "deposits", "wallets"
  add_foreign_key "event_changes", "events"
  add_foreign_key "events", "courts"
  add_foreign_key "events", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "special_prices", "courts"
  add_foreign_key "stadia", "categories"
  add_foreign_key "stadia", "users"
  add_foreign_key "stadiums", "categories"
  add_foreign_key "stadiums", "users"
  add_foreign_key "wallets", "users"
  add_foreign_key "withdrawals", "wallets"
end
