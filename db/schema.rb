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

ActiveRecord::Schema.define(version: 20181101111626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.boolean "key"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_features_on_property_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "key"
    t.index ["property_id"], name: "index_photos_on_property_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hero_image"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.boolean "in_aviemore"
    t.boolean "in_country"
    t.text "we_love"
    t.text "guests_love"
    t.string "meta_title"
    t.text "meta_description"
    t.boolean "games_room"
    t.string "floorplan"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.index ["property_id"], name: "index_reviews_on_property_id"
  end

  add_foreign_key "features", "properties"
  add_foreign_key "photos", "properties"
  add_foreign_key "reviews", "properties"
end
