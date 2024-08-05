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

ActiveRecord::Schema[7.1].define(version: 2022_07_24_181113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.string "vendor"
    t.text "icon"
    t.text "description"
    t.string "support_url"
    t.string "category"
    t.text "images"
    t.string "vendor_url"
    t.string "app_url"
    t.boolean "active"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_apps_on_slug", unique: true
    t.index ["user_id"], name: "index_apps_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "title"
    t.string "example"
    t.text "description"
    t.string "category"
    t.integer "impact"
    t.integer "priority"
    t.string "status"
    t.bigint "app_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["app_id"], name: "index_checklists_on_app_id"
    t.index ["slug"], name: "index_checklists_on_slug", unique: true
  end

  create_table "domains", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_domains_on_slug", unique: true
    t.index ["user_id"], name: "index_domains_on_user_id"
  end

  create_table "user_checklists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "domain_id", null: false
    t.bigint "checklist_id", null: false
    t.bigint "app_id", null: false
    t.boolean "done"
    t.string "evaluation"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_user_checklists_on_app_id"
    t.index ["checklist_id"], name: "index_user_checklists_on_checklist_id"
    t.index ["domain_id"], name: "index_user_checklists_on_domain_id"
    t.index ["user_id"], name: "index_user_checklists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.text "customer_image"
    t.boolean "admin"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "apps", "users"
  add_foreign_key "checklists", "apps"
  add_foreign_key "domains", "users"
  add_foreign_key "user_checklists", "apps"
  add_foreign_key "user_checklists", "checklists"
  add_foreign_key "user_checklists", "domains"
  add_foreign_key "user_checklists", "users"
end
