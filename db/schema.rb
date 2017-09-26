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

ActiveRecord::Schema.define(version: 20170926080453) do

  create_table "economic_event_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "economic_event_id"
    t.datetime "released"
    t.boolean "preliminary"
    t.float "actual", limit: 24
    t.float "forecast", limit: 24
    t.float "previous", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["economic_event_id"], name: "index_economic_event_instances_on_economic_event_id"
  end

  create_table "economic_event_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "economic_event_id"
    t.string "url_path", limit: 2000
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["economic_event_id"], name: "index_economic_event_sources_on_economic_event_id"
  end

  create_table "economic_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "name", limit: 300
    t.string "alt_name", limit: 300
    t.text "description"
    t.integer "impact"
    t.string "currency", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency", "impact"], name: "index_economic_events_on_currency_and_impact"
    t.index ["name"], name: "index_economic_events_on_name", unique: true
  end

  add_foreign_key "economic_event_instances", "economic_events"
  add_foreign_key "economic_event_sources", "economic_events"
end
