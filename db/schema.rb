# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_19_004857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street1"
    t.string "street2"
    t.bigint "city_zip_code_id", null: false
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_zip_code_id"], name: "index_addresses_on_city_zip_code_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "city_zip_codes", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "zip_code_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_city_zip_codes_on_city_id"
    t.index ["zip_code_id"], name: "index_city_zip_codes_on_zip_code_id"
  end

  create_table "contractor_images", force: :cascade do |t|
    t.string "url"
    t.bigint "contractor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contractor_id"], name: "index_contractor_images_on_contractor_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "background_check"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "status"
    t.bigint "contractor_id", null: false
    t.bigint "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contractor_id"], name: "index_contracts_on_contractor_id"
    t.index ["user_profile_id"], name: "index_contracts_on_user_profile_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "card_number"
    t.date "card_exp_date"
    t.string "card_cvc_number"
    t.bigint "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_profile_id"], name: "index_credit_cards_on_user_profile_id"
  end

  create_table "job_categories", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_category_contractors", force: :cascade do |t|
    t.bigint "job_category_id", null: false
    t.bigint "contractor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contractor_id"], name: "index_job_category_contractors_on_contractor_id"
    t.index ["job_category_id"], name: "index_job_category_contractors_on_job_category_id"
  end

  create_table "job_images", force: :cascade do |t|
    t.string "url"
    t.bigint "job_posting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_posting_id"], name: "index_job_images_on_job_posting_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "job_category_id", null: false
    t.bigint "contract_id", null: false
    t.bigint "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_job_postings_on_contract_id"
    t.index ["job_category_id"], name: "index_job_postings_on_job_category_id"
    t.index ["user_profile_id"], name: "index_job_postings_on_user_profile_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "kind"
    t.string "value"
    t.bigint "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_profile_id"], name: "index_phones_on_user_profile_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.text "review_text"
    t.bigint "user_profile_id", null: false
    t.bigint "contractor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contractor_id"], name: "index_ratings_on_contractor_id"
    t.index ["user_profile_id"], name: "index_ratings_on_user_profile_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_images", force: :cascade do |t|
    t.string "url"
    t.bigint "user_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_profile_id"], name: "index_user_images_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "ex_email"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_user_profiles_on_address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "city_zip_codes"
  add_foreign_key "addresses", "states"
  add_foreign_key "city_zip_codes", "cities"
  add_foreign_key "city_zip_codes", "zip_codes"
  add_foreign_key "contractor_images", "contractors"
  add_foreign_key "contracts", "contractors"
  add_foreign_key "contracts", "user_profiles"
  add_foreign_key "credit_cards", "user_profiles"
  add_foreign_key "job_category_contractors", "contractors"
  add_foreign_key "job_category_contractors", "job_categories"
  add_foreign_key "job_images", "job_postings"
  add_foreign_key "job_postings", "contracts"
  add_foreign_key "job_postings", "job_categories"
  add_foreign_key "job_postings", "user_profiles"
  add_foreign_key "phones", "user_profiles"
  add_foreign_key "ratings", "contractors"
  add_foreign_key "ratings", "user_profiles"
  add_foreign_key "user_images", "user_profiles"
  add_foreign_key "user_profiles", "addresses"
end
