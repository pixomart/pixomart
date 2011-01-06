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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101227085624) do

  create_table "admins", :force => true do |t|
    t.string   "email",              :limit => 50
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "name",               :limit => 50
    t.datetime "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.integer  "status",     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_items", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "item_id"
  end

  add_index "categories_items", ["category_id", "item_id"], :name => "index_categories_items_on_category_id_and_item_id"

  create_table "comments", :force => true do |t|
    t.integer  "status",     :limit => 1
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.integer  "downloads"
    t.integer  "rating",           :limit => 8
    t.string   "decription"
    t.string   "files_included"
    t.string   "dimensions",       :limit => 20
    t.integer  "layered",          :limit => 1
    t.string   "adobe_version",    :limit => 30
    t.float    "price"
    t.string   "notes"
    t.string   "file_type",        :limit => 30
    t.string   "thumbnail_images"
    t.string   "preview_images"
    t.integer  "license_id"
    t.integer  "status",           :limit => 1
    t.integer  "purchases"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_tags", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "tag_id"
  end

  add_index "items_tags", ["item_id", "tag_id"], :name => "index_items_tags_on_item_id_and_tag_id"

  create_table "items_users", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "user_id"
  end

  add_index "items_users", ["user_id", "item_id"], :name => "index_items_users_on_user_id_and_item_id"

  create_table "licenses", :force => true do |t|
    t.string   "license_title"
    t.text     "license"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.integer  "admin_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.integer  "billing_cycle"
    t.integer  "status",        :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.integer  "payment_status", :limit => 1
    t.integer  "payment_type",   :limit => 1
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "paypal_account", :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",         :limit => 30
    t.string   "last_name",          :limit => 30
    t.string   "email",              :limit => 50
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.datetime "last_login"
    t.integer  "membership_id"
    t.integer  "item_id"
    t.integer  "downloads_count"
    t.string   "user_type",          :limit => 20
    t.integer  "status",             :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
