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

ActiveRecord::Schema.define(version: 2019_11_15_215258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", null: false
    t.index ["username"], name: "auth_user_username_6821ab7c_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
    t.index ["user_id"], name: "auth_user_groups_user_id_6a12ed8b"
  end

  create_table "auth_user_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_user_id_a95ead1b"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.datetime "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "events_company", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "name", limit: 100
    t.index ["name"], name: "events_company_name_dbdde651_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "events_company_name_key", unique: true
  end

  create_table "events_emailaddress", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "value", limit: 254, null: false
    t.index ["value"], name: "events_emailaddress_value_c2168c05_like", opclass: :varchar_pattern_ops
    t.index ["value"], name: "events_emailaddress_value_key", unique: true
  end

  create_table "events_event", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "name", limit: 250, null: false
  end

  create_table "events_eventmembership", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.boolean "active", null: false
    t.string "order_id", limit: 10
    t.integer "participant_id"
    t.integer "event_id", null: false
    t.integer "company_id"
    t.string "participant_status", limit: 100
    t.string "profession", limit: 100
    t.integer "score"
    t.boolean "unambiguous", null: false
    t.integer "team_id"
    t.index ["company_id"], name: "events_eventmembership_company_id_58d214e6"
    t.index ["event_id"], name: "events_eventmembership_event_id_4fe2385a"
    t.index ["participant_id"], name: "events_eventmembership_Participant_id_d15a5d2c"
    t.index ["team_id"], name: "events_eventmembership_team_id_eec0a517"
  end

  create_table "events_hackerrankusername", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "value", limit: 100, null: false
    t.index ["value"], name: "events_hackerrankusername_value_7c185eff_like", opclass: :varchar_pattern_ops
    t.index ["value"], name: "events_hackerrankusername_value_key", unique: true
  end

  create_table "events_participant", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "first_name", limit: 250, null: false
    t.string "last_name", limit: 250, null: false
    t.boolean "wyncode_alum", null: false
    t.integer "email_id"
    t.integer "hackerrank_username_id"
    t.string "portfolio_link", limit: 200
    t.index ["email_id"], name: "events_participant_email_id_947cd57d"
    t.index ["first_name", "last_name", "email_id", "hackerrank_username_id"], name: "events_participant_first_name_last_name_ema_68f2016a_uniq", unique: true
    t.index ["hackerrank_username_id"], name: "events_participant_hackerrank_username_id_2080dee7"
  end

  create_table "events_team", id: :serial, force: :cascade do |t|
    t.datetime "created_on", null: false
    t.datetime "modified_on", null: false
    t.string "name", limit: 100
    t.index ["name"], name: "events_team_name_831730cf_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "events_team_name_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
  add_foreign_key "events_eventmembership", "events_company", column: "company_id", name: "events_eventmembership_company_id_58d214e6_fk_events_company_id"
  add_foreign_key "events_eventmembership", "events_event", column: "event_id", name: "events_eventmembership_event_id_4fe2385a_fk_events_event_id"
  add_foreign_key "events_eventmembership", "events_participant", column: "participant_id", name: "events_eventmembersh_participant_id_10f6395a_fk_events_pa"
  add_foreign_key "events_eventmembership", "events_team", column: "team_id", name: "events_eventmembership_team_id_eec0a517_fk_events_team_id"
  add_foreign_key "events_participant", "events_emailaddress", column: "email_id", name: "events_participant_email_id_947cd57d_fk_events_emailaddress_id"
  add_foreign_key "events_participant", "events_hackerrankusername", column: "hackerrank_username_id", name: "events_participant_hackerrank_username__2080dee7_fk_events_ha"
end
