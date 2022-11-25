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

ActiveRecord::Schema[7.0].define(version: 2022_11_24_144244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approval_items", id: :serial, force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "resource_id"
    t.string "resource_type", null: false
    t.string "event", null: false
    t.text "params"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["request_id"], name: "index_approval_items_on_request_id"
    t.index ["resource_id", "resource_type"], name: "index_approval_items_on_resource_id_and_resource_type"
  end

  create_table "approval_requests", id: :serial, force: :cascade do |t|
    t.integer "request_user_id", null: false
    t.integer "respond_user_id"
    t.integer "state", limit: 2, default: 0, null: false
    t.datetime "requested_at", precision: nil, null: false
    t.datetime "cancelled_at", precision: nil
    t.datetime "approved_at", precision: nil
    t.datetime "rejected_at", precision: nil
    t.datetime "executed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["request_user_id"], name: "index_approval_requests_on_request_user_id"
    t.index ["respond_user_id"], name: "index_approval_requests_on_respond_user_id"
    t.index ["state"], name: "index_approval_requests_on_state"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "broomstick_id"
    t.boolean "approved", default: false
    t.index ["broomstick_id"], name: "index_bookings_on_broomstick_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "broomsticks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "speed"
    t.integer "stability"
    t.integer "price"
    t.bigint "user_id"
    t.string "description"
    t.string "address"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.string "country"
    t.index ["user_id"], name: "index_broomsticks_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "broomstick_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["broomstick_id"], name: "index_reviews_on_broomstick_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bookings", "broomsticks"
  add_foreign_key "bookings", "users"
  add_foreign_key "broomsticks", "users"
  add_foreign_key "reviews", "broomsticks"
  add_foreign_key "reviews", "users"
end
