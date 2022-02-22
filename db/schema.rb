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

ActiveRecord::Schema.define(version: 20220222132740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.boolean  "status"
    t.datetime "date_publish"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "classified_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "classified_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["classified_id"], name: "index_classified_images_on_classified_id", using: :btree
  end

  create_table "classifieds", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_builder_archives", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "content_builder_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["content_builder_id"], name: "index_content_builder_archives_on_content_builder_id", using: :btree
  end

  create_table "content_builder_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_builder_count_reads", force: :cascade do |t|
    t.integer  "content_builder_id"
    t.string   "ip"
    t.string   "string"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["content_builder_id"], name: "index_content_builder_count_reads_on_content_builder_id", using: :btree
  end

  create_table "content_builder_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "content_builder_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["content_builder_id"], name: "index_content_builder_images_on_content_builder_id", using: :btree
  end

  create_table "content_builders", force: :cascade do |t|
    t.string   "title"
    t.string   "written_by"
    t.datetime "date_publish"
    t.text     "content"
    t.boolean  "status",                      default: false
    t.string   "slug"
    t.text     "summary"
    t.integer  "content_builder_category_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["content_builder_category_id"], name: "index_content_builders_on_content_builder_category_id", using: :btree
  end

  create_table "featured_content_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "featured_content_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["featured_content_id"], name: "index_featured_content_images_on_featured_content_id", using: :btree
  end

  create_table "featured_contents", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_photos_on_album_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.datetime "date_publish"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_foreign_key "classified_images", "classifieds"
  add_foreign_key "content_builder_archives", "content_builders"
  add_foreign_key "content_builder_count_reads", "content_builders"
  add_foreign_key "content_builder_images", "content_builders"
  add_foreign_key "content_builders", "content_builder_categories"
  add_foreign_key "featured_content_images", "featured_contents"
  add_foreign_key "photos", "albums"
end
