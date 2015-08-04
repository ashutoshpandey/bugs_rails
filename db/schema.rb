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

ActiveRecord::Schema.define(version: 20150730063844) do

  create_table "bug_comment_files", force: :cascade do |t|
    t.string   "file_name",       limit: 255, null: false
    t.string   "saved_file_name", limit: 255
    t.integer  "bug_comment_id",  limit: 4
    t.string   "status",          limit: 255
    t.datetime "created_at"
  end

  create_table "bug_comments", force: :cascade do |t|
    t.string   "comment",    limit: 255, null: false
    t.integer  "created_by", limit: 4
    t.integer  "bug_id",     limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at"
  end

  create_table "bug_files", force: :cascade do |t|
    t.string   "file_name",       limit: 255, null: false
    t.string   "saved_file_name", limit: 255
    t.integer  "bug_id",          limit: 4
    t.string   "status",          limit: 255
    t.datetime "created_at"
  end

  create_table "bug_users", force: :cascade do |t|
    t.integer  "bug_id",     limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at"
  end

  create_table "bugss", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.string   "description", limit: 255
    t.string   "severity",    limit: 255
    t.integer  "created_by",  limit: 4
    t.integer  "project_id",  limit: 4
    t.string   "status",      limit: 255
    t.datetime "created_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_by"
    t.string   "status",      limit: 255
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "gender",     limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at"
  end

end
