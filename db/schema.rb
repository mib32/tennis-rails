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

ActiveRecord::Schema.define(version: 20150531071345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_event_items", force: :cascade do |t|
    t.integer  "related_id"
    t.string   "related_type"
    t.integer  "event_id"
    t.integer  "amount",       default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "additional_event_items", ["event_id"], name: "index_additional_event_items_on_event_id", using: :btree
  add_index "additional_event_items", ["related_type", "related_id"], name: "index_additional_event_items_on_related_type_and_related_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "coach_profiles", force: :cascade do |t|
    t.string   "description"
    t.string   "photo"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coach_profiles", ["user_id"], name: "index_coach_profiles_on_user_id", using: :btree

  create_table "coaches_courts", force: :cascade do |t|
    t.integer "coach_id"
    t.integer "court_id"
    t.decimal "price",    precision: 8, scale: 2, default: 0.0
  end

  add_index "coaches_courts", ["coach_id"], name: "index_coaches_courts_on_coach_id", using: :btree
  add_index "coaches_courts", ["court_id"], name: "index_coaches_courts_on_court_id", using: :btree

  create_table "courts", force: :cascade do |t|
    t.string   "name"
    t.integer  "stadium_id"
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "change_price", precision: 8, scale: 2
  end

  add_index "courts", ["stadium_id"], name: "index_courts_on_stadium_id", using: :btree

  create_table "deposit_requests", force: :cascade do |t|
    t.integer  "wallet_id"
    t.integer  "status"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "data"
  end

  add_index "deposit_requests", ["wallet_id"], name: "index_deposit_requests_on_wallet_id", using: :btree

  create_table "deposit_responses", force: :cascade do |t|
    t.integer  "deposit_request_id"
    t.integer  "status"
    t.text     "data"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "deposit_responses", ["deposit_request_id"], name: "index_deposit_responses_on_deposit_request_id", using: :btree

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
    t.integer  "order_id"
  end

  add_index "event_changes", ["event_id"], name: "index_event_changes_on_event_id", using: :btree
  add_index "event_changes", ["order_id"], name: "index_event_changes_on_order_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "description"
    t.integer  "order_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "recurrence_rule"
    t.string   "recurrence_exception"
    t.integer  "recurrence_id"
    t.boolean  "is_all_day"
    t.integer  "court_id"
  end

  add_index "events", ["order_id"], name: "index_events_on_order_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "tax",            default: 5
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "feedback_email"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total",      precision: 8, scale: 2
    t.integer  "status"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "stadium_id"
    t.string   "comment"
    t.integer  "coach_id"
  end

  add_index "orders", ["coach_id"], name: "index_orders_on_coach_id", using: :btree
  add_index "orders", ["stadium_id"], name: "index_orders_on_stadium_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.text     "text"
    t.integer  "user_id"
    t.boolean  "verified"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "rating"
  end

  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "address"
    t.float    "latitude",    default: 55.75
    t.float    "longitude",   default: 37.61
    t.string   "slug"
    t.integer  "status",      default: 0
  end

  add_index "stadiums", ["category_id"], name: "index_stadiums_on_category_id", using: :btree
  add_index "stadiums", ["user_id"], name: "index_stadiums_on_user_id", using: :btree

  create_table "static_pages", force: :cascade do |t|
    t.text     "text"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                          default: "",  null: false
    t.string   "encrypted_password",                             default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.string   "type"
    t.string   "slug"
    t.decimal  "price",                  precision: 8, scale: 2, default: 0.0
    t.string   "avatar"
    t.integer  "status"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

  create_table "withdrawal_requests", force: :cascade do |t|
    t.integer  "wallet_id"
    t.integer  "status"
    t.decimal  "amount",     precision: 8, scale: 2
    t.text     "data"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "withdrawal_requests", ["wallet_id"], name: "index_withdrawal_requests_on_wallet_id", using: :btree

  create_table "withdrawals", force: :cascade do |t|
    t.integer  "wallet_id"
    t.integer  "status"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "withdrawals", ["wallet_id"], name: "index_withdrawals_on_wallet_id", using: :btree

  add_foreign_key "additional_event_items", "events"
  add_foreign_key "coach_profiles", "users"
  add_foreign_key "courts", "stadiums"
  add_foreign_key "deposit_requests", "wallets"
  add_foreign_key "deposit_responses", "deposit_requests"
  add_foreign_key "deposits", "wallets"
  add_foreign_key "event_changes", "events"
  add_foreign_key "event_changes", "orders"
  add_foreign_key "events", "orders"
  add_foreign_key "orders", "stadiums"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "special_prices", "courts"
  add_foreign_key "stadia", "categories"
  add_foreign_key "stadia", "users"
  add_foreign_key "stadiums", "categories"
  add_foreign_key "stadiums", "users"
  add_foreign_key "wallets", "users"
  add_foreign_key "withdrawal_requests", "wallets"
  add_foreign_key "withdrawals", "wallets"
end
