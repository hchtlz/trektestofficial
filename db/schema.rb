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

ActiveRecord::Schema[8.0].define(version: 2025_06_19_085231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "external_links", force: :cascade do |t|
    t.string "key"
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_external_links_on_key", unique: true
  end

  create_table "fragments", force: :cascade do |t|
    t.string "key"
    t.string "namespace"
    t.integer "position", null: false
    t.jsonb "title", default: {}
    t.jsonb "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key", "namespace"], name: "index_fragments_on_key_and_namespace", unique: true
    t.index ["key"], name: "index_fragments_on_key"
    t.index ["namespace"], name: "index_fragments_on_namespace"
  end

  create_table "menu_node_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "menu_node_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "menu_node_desc_idx"
  end

  create_table "menu_nodes", force: :cascade do |t|
    t.string "key"
    t.jsonb "title", default: {}
    t.jsonb "label", default: {}
    t.integer "position", null: false
    t.bigint "parent_id"
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.string "icon_key"
    t.string "modifiers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key", "parent_id"], name: "index_menu_nodes_on_key_and_parent_id", unique: true
    t.index ["linkable_type", "linkable_id"], name: "index_menu_nodes_on_linkable"
    t.index ["parent_id"], name: "index_menu_nodes_on_parent_id"
  end

  create_table "page_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "page_desc_idx"
  end

  create_table "page_paths", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.jsonb "path", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_paths_on_page_id"
  end

  create_table "page_versions", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.string "name", null: false
    t.jsonb "content"
    t.jsonb "image_data"
    t.datetime "current_since"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_versions_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "key"
    t.jsonb "slug", default: {}
    t.jsonb "title", default: {}
    t.jsonb "description", default: {}
    t.string "pageable_type"
    t.bigint "pageable_id"
    t.integer "position", null: false
    t.bigint "parent_id"
    t.jsonb "image_data"
    t.jsonb "content"
    t.boolean "versioned", default: false, null: false
    t.boolean "sectioned", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_path_id"
    t.index ["current_path_id"], name: "index_pages_on_current_path_id"
    t.index ["key"], name: "index_pages_on_key", unique: true
    t.index ["pageable_type", "pageable_id"], name: "index_pages_on_pageable"
    t.index ["parent_id"], name: "index_pages_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "failed_logins_count", default: 0
    t.datetime "lock_expires_at"
    t.string "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string "last_login_from_ip_address"
    t.string "name"
    t.integer "theme", default: 0, null: false
    t.string "locale"
    t.integer "role", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

  add_foreign_key "page_paths", "pages"
  add_foreign_key "page_versions", "pages"
  add_foreign_key "pages", "page_paths", column: "current_path_id"
end
