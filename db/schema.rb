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

ActiveRecord::Schema.define(version: 2021_03_11_055131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sell_orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price"
    t.date "expiry_date"
    t.bigint "stock_id", null: false
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "filled", default: false
    t.index ["buyer_id"], name: "index_sell_orders_on_buyer_id"
    t.index ["seller_id"], name: "index_sell_orders_on_seller_id"
    t.index ["stock_id"], name: "index_sell_orders_on_stock_id"
  end

  create_table "sentiments", force: :cascade do |t|
    t.boolean "is_bearish"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_sentiments_on_stock_id"
    t.index ["user_id"], name: "index_sentiments_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "sell_orders", "stocks"
  add_foreign_key "sell_orders", "users", column: "buyer_id"
  add_foreign_key "sell_orders", "users", column: "seller_id"
  add_foreign_key "sentiments", "stocks"
  add_foreign_key "sentiments", "users"
end
