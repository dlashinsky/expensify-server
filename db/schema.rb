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

ActiveRecord::Schema.define(version: 2021_04_13_224102) do

  create_table "credit_cards", force: :cascade do |t|
    t.string "nick_name"
    t.string "bank_name"
    t.integer "current_bal"
    t.integer "credit_limit"
    t.integer "min_payment"
    t.integer "actual_payment"
    t.integer "last_four_card"
    t.integer "payment_day"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "fixed_expenses", force: :cascade do |t|
    t.string "exp_name"
    t.string "exp_type"
    t.integer "exp_amount"
    t.string "payment_day"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_fixed_expenses_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "nick_name"
    t.string "bank_name"
    t.integer "current_bal"
    t.integer "min_payment"
    t.integer "actual_payment"
    t.integer "last_four_acct"
    t.integer "payment_day"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "variable_expenses", force: :cascade do |t|
    t.string "exp_name"
    t.string "exp_type"
    t.integer "monthly_min"
    t.integer "monthly_max"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_variable_expenses_on_user_id"
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "fixed_expenses", "users"
  add_foreign_key "loans", "users"
  add_foreign_key "variable_expenses", "users"
end
