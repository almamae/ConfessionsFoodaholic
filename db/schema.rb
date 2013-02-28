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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130227172724) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "flaggings", :force => true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flaggings"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.string   "category"
    t.integer  "isApproved",                    :default => 0
    t.string   "caption"
    t.string   "file_name"
    t.string   "file_type"
    t.binary   "data",       :limit => 6291456
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "recipe_id"
    t.integer  "user_id"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "occupation"
    t.string   "province"
    t.string   "city"
    t.string   "isConfirmed"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "g_plus"
    t.integer  "isBanned",          :default => 0
    t.integer  "isReported",        :default => 0
    t.datetime "dateReported"
    t.string   "user_type",         :default => "unconfirmed member"
    t.string   "confirmation_code"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

end
