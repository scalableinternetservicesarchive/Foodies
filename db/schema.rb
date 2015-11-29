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

ActiveRecord::Schema.define(version: 20151117013349) do

  create_table "collection_recipes", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "collection_recipes", ["collection_id"], name: "index_collection_recipes_on_collection_id"
  add_index "collection_recipes", ["recipe_id"], name: "index_collection_recipes_on_recipe_id"

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id",  null: false
    t.string   "name",       null: false
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name"
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "masterpieces", force: :cascade do |t|
    t.integer  "recipe_id",                    null: false
    t.integer  "user_id",                      null: false
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "masterpiece_img_file_name"
    t.string   "masterpiece_img_content_type"
    t.integer  "masterpiece_img_file_size"
    t.datetime "masterpiece_img_updated_at"
  end

  add_index "masterpieces", ["recipe_id"], name: "index_masterpieces_on_recipe_id"
  add_index "masterpieces", ["user_id"], name: "index_masterpieces_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.string   "title",                               null: false
    t.text     "description"
    t.integer  "cook_time"
    t.integer  "user_bookmark_count",     default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "recipe_img_file_name"
    t.string   "recipe_img_content_type"
    t.integer  "recipe_img_file_size"
    t.datetime "recipe_img_updated_at"
  end

  add_index "recipes", ["user_bookmark_count"], name: "index_recipes_on_user_bookmark_count"
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"
  add_index "recipes", ["title"], name: "index_recipes_on_title"


  create_table "seed_statuses", force: :cascade do |t|
    t.boolean  "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seed_statuses", ["status"], name: "index_seed_statuses_on_status", unique: true

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id",             null: false
    t.integer  "step_number",           null: false
    t.text     "description",           null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "step_img_file_name"
    t.string   "step_img_content_type"
    t.integer  "step_img_file_size"
    t.datetime "step_img_updated_at"
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "user_bookmark_collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_bookmark_collections", ["collection_id"], name: "index_user_bookmark_collections_on_collection_id"
  add_index "user_bookmark_collections", ["user_id"], name: "index_user_bookmark_collections_on_user_id"

  create_table "user_bookmark_recipes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "recipe_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_bookmark_recipes", ["recipe_id"], name: "index_user_bookmark_recipes_on_recipe_id"
  add_index "user_bookmark_recipes", ["user_id"], name: "index_user_bookmark_recipes_on_user_id"

  create_table "user_like_masterpieces", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "masterpiece_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_like_masterpieces", ["masterpiece_id"], name: "index_user_like_masterpieces_on_masterpiece_id"
  add_index "user_like_masterpieces", ["user_id"], name: "index_user_like_masterpieces_on_user_id"

  create_table "user_like_recipes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "recipe_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_like_recipes", ["recipe_id"], name: "index_user_like_recipes_on_recipe_id"
  add_index "user_like_recipes", ["user_id"], name: "index_user_like_recipes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
