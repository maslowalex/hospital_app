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

ActiveRecord::Schema.define(version: 2018_08_19_105831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospitals", force: :cascade do |t|
    t.integer "number", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals_workers", id: false, force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.bigint "worker_id", null: false
    t.index ["hospital_id", "worker_id"], name: "index_hospitals_workers_on_hospital_id_and_worker_id"
    t.index ["worker_id", "hospital_id"], name: "index_hospitals_workers_on_worker_id_and_hospital_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "surname"
    t.integer "birth_year"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_workers_on_position"
  end

end
