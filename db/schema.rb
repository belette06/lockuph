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

ActiveRecord::Schema.define(version: 2019_04_28_022621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "appointements", force: :cascade do |t|
    t.boolean "completed"
    t.daterange "reservation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "online", default: false
    t.bigint "proprietor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proprietor_id"], name: "index_homes_on_proprietor_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_professionals_on_email", unique: true
    t.index ["reset_password_token"], name: "index_professionals_on_reset_password_token", unique: true
  end

  create_table "proprietors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_proprietors_on_user_id"
  end

  create_table "tenant_homes", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "home_id"
    t.index ["home_id"], name: "index_tenant_homes_on_home_id"
    t.index ["tenant_id"], name: "index_tenant_homes_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "homes", "proprietors"
  add_foreign_key "proprietors", "users"
  add_foreign_key "tenant_homes", "homes"
  add_foreign_key "tenant_homes", "tenants"
  add_foreign_key "tenants", "users"
end
