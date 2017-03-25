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

ActiveRecord::Schema.define(version: 20170325063712) do

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "request_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "support_logs", force: :cascade do |t|
    t.string   "content",            limit: 255
    t.integer  "agent_id",           limit: 4
    t.integer  "support_request_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "support_logs", ["agent_id"], name: "index_support_logs_on_agent_id", using: :btree
  add_index "support_logs", ["support_request_id"], name: "index_support_logs_on_support_request_id", using: :btree

  create_table "support_requests", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "creator_id",       limit: 4
    t.integer  "handler_id",       limit: 4
    t.integer  "product_id",       limit: 4
    t.integer  "request_state_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "support_requests", ["creator_id"], name: "index_support_requests_on_creator_id", using: :btree
  add_index "support_requests", ["handler_id"], name: "index_support_requests_on_handler_id", using: :btree
  add_index "support_requests", ["product_id"], name: "index_support_requests_on_product_id", using: :btree
  add_index "support_requests", ["request_state_id"], name: "index_support_requests_on_request_state_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "fullname",               limit: 255, default: "", null: false
    t.integer  "role_id",                limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "support_requests", "products"
  add_foreign_key "support_requests", "request_states"
  add_foreign_key "support_requests", "users", column: "creator_id"
  add_foreign_key "support_requests", "users", column: "handler_id"
end
