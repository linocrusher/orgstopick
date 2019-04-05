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

ActiveRecord::Schema.define(version: 20190405115113) do

  create_table "orgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "acronym"
    t.string "college"
    t.string "scope"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
    t.float "rating", limit: 24
    t.text "contact"
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "community"
    t.integer "purpose"
    t.integer "selfbenefit"
    t.integer "application"
    t.text "details"
    t.bigint "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_id"], name: "index_ratings_on_org_id"
  end

  add_foreign_key "ratings", "orgs"
end
