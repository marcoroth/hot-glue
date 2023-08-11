# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_17_162618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "genres", ["Fiction", "Nonfiction", "Mystery", "Romance", "Novel"]

  create_table "abcs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atw_display_names", force: :cascade do |t|
    t.string "display_name"
    t.integer "xyz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atw_full_names", force: :cascade do |t|
    t.string "full_name"
    t.integer "xyz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atw_to_labels", force: :cascade do |t|
    t.string "to_label"
    t.integer "xyz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borkeds", force: :cascade do |t|
    t.integer "xyz_id"
    t.integer "missing_label_table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cantelopes", force: :cascade do |t|
    t.string "name"
    t.string "_a_show_only_field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dfgs", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cantelope_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ghis", force: :cascade do |t|
    t.integer "dfg_id"
    t.integer "xyz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hgis", force: :cascade do |t|
    t.string "name"
    t.integer "how_many"
    t.text "hello"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "humans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jkls", force: :cascade do |t|
    t.integer "hgi_id"
    t.string "name"
    t.string "blurb"
    t.text "long_description"
    t.float "cost"
    t.integer "how_many_printed"
    t.datetime "approved_at", precision: nil
    t.date "release_on"
    t.time "time_of_day"
    t.boolean "selected"
    t.enum "genre", enum_type: "genres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missing_label_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "human_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xyzs", force: :cascade do |t|
    t.integer "nothing_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
