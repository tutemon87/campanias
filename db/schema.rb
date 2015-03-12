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

ActiveRecord::Schema.define(version: 20150310231558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "content"
    t.integer  "question_id"
    t.integer  "survey_result_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["option_id"], name: "index_answers_on_option_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["survey_result_id"], name: "index_answers_on_survey_result_id", using: :btree

  create_table "answers_options", id: false, force: true do |t|
    t.integer "answer_id"
    t.integer "option_id"
  end

  add_index "answers_options", ["answer_id", "option_id"], name: "index_answers_options_on_answer_id_and_option_id", using: :btree

  create_table "options", force: true do |t|
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "content"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type",        default: 1
    t.boolean  "is_required"
    t.integer  "max_options"
    t.integer  "min_options"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "results", force: true do |t|
    t.string   "type"
    t.datetime "started_date"
    t.datetime "ended_date"
    t.text     "comment"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["survey_id"], name: "index_results_on_survey_id", using: :btree
  add_index "results", ["task_id"], name: "index_results_on_task_id", using: :btree
  add_index "results", ["user_id"], name: "index_results_on_user_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "started_on"
    t.date     "expired_on"
    t.integer  "targeted_to"
    t.string   "type"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "action"
    t.string   "location"
    t.datetime "date"
    t.integer  "survey_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "user_id"
  end

  add_index "tasks", ["survey_id"], name: "index_tasks_on_survey_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
