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

ActiveRecord::Schema.define(version: 20180809161647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_photos_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "code"
    t.boolean "enabled"
    t.string "name"
    t.integer "sleeps"
    t.string "headline"
    t.text "description"
    t.decimal "min_daily_price", precision: 6, scale: 2
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.boolean "wood_stove"
    t.boolean "hot_tub"
    t.boolean "pet_friendly"
    t.boolean "sauna"
    t.text "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hero_image"
  end

  add_foreign_key "photos", "properties"
end
