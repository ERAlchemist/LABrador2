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

ActiveRecord::Schema.define(version: 2018_04_05_021350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recurrences", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "recurring"
    t.datetime "start_time"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "complete"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_completed"
    t.boolean "is_recurring"
    t.integer "recurrence_interval"
  end

  create_table "samples", force: :cascade do |t|
    t.bigint "request_id"
    t.string "tank"
    t.string "lot_id"
    t.datetime "time_completed"
    t.boolean "complete"
    t.boolean "is_empty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sample_size"
    t.index ["request_id"], name: "index_samples_on_request_id"
  end

end
