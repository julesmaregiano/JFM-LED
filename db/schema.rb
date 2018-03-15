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

ActiveRecord::Schema.define(version: 20180315024330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.bigint "booking_id"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.integer "addressable_id"
    t.index ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"
    t.index ["booking_id"], name: "index_addresses_on_booking_id"
    t.index ["branch_id"], name: "index_addresses_on_branch_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "option_choice_id"
    t.bigint "report_id"
    t.integer "numeric"
    t.string "string"
    t.string "boolean"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["option_choice_id"], name: "index_answers_on_option_choice_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["report_id"], name: "index_answers_on_report_id"
  end

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "booking_id"
    t.date "date"
    t.integer "status"
    t.integer "half"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_availabilities_on_booking_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "booked_product_options", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "option_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "custom_value", default: false
    t.bigint "option_id"
    t.string "value"
    t.index ["booking_id"], name: "index_booked_product_options_on_booking_id"
    t.index ["option_id"], name: "index_booked_product_options_on_option_id"
    t.index ["option_value_id"], name: "index_booked_product_options_on_option_value_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address1"
    t.datetime "confirmed_at"
    t.text "comment"
    t.string "surface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.bigint "foreman_id"
    t.bigint "product_id"
    t.string "reference"
    t.string "bookable_type"
    t.bigint "bookable_id"
    t.index ["bookable_type", "bookable_id"], name: "index_bookings_on_bookable_type_and_bookable_id"
    t.index ["foreman_id"], name: "index_bookings_on_foreman_id"
    t.index ["product_id"], name: "index_bookings_on_product_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "zipcode"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "siret"
  end

  create_table "company_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "half_day_price"
    t.float "day_price"
    t.index ["company_id"], name: "index_company_products_on_company_id"
    t.index ["product_id"], name: "index_company_products_on_product_id"
  end

  create_table "foremen", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_foremen_on_branch_id"
  end

  create_table "framework_contracts", force: :cascade do |t|
    t.date "starts_at"
    t.date "ends_at"
    t.float "day_price"
    t.integer "half_day_price"
    t.bigint "company_id"
    t.bigint "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["company_id"], name: "index_framework_contracts_on_company_id"
    t.index ["product_id"], name: "index_framework_contracts_on_product_id"
    t.index ["service_provider_id"], name: "index_framework_contracts_on_service_provider_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.bigint "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
    t.index ["service_provider_id"], name: "index_managers_on_service_provider_id"
  end

  create_table "option_choices", force: :cascade do |t|
    t.string "name"
    t.bigint "option_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_group_id"], name: "index_option_choices_on_option_group_id"
  end

  create_table "option_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_values", force: :cascade do |t|
    t.bigint "option_id"
    t.string "label"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_option_values_on_option_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "custom_value", default: false
  end

  create_table "product_options", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "option_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_product_options_on_option_id"
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_questions_on_product_id"
    t.index ["question_id"], name: "index_product_questions_on_question_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.bigint "section_id"
    t.string "information"
    t.bigint "option_group_id"
    t.integer "input_type"
    t.string "slug"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display"
    t.boolean "active"
    t.integer "order"
    t.index ["option_group_id"], name: "index_questions_on_option_group_id"
    t.index ["section_id"], name: "index_questions_on_section_id"
    t.index ["unit_id"], name: "index_questions_on_unit_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.binary "signature"
    t.datetime "signed_on"
    t.index ["booking_id"], name: "index_reports_on_booking_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "name"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.bigint "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_provider_id"], name: "index_technicians_on_service_provider_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.string "address"
    t.string "phone"
    t.bigint "company_id"
    t.bigint "branch_id"
    t.binary "signature"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "bookings"
  add_foreign_key "addresses", "branches"
  add_foreign_key "answers", "option_choices"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "reports"
  add_foreign_key "availabilities", "bookings"
  add_foreign_key "availabilities", "users"
  add_foreign_key "booked_product_options", "bookings"
  add_foreign_key "booked_product_options", "option_values"
  add_foreign_key "booked_product_options", "options"
  add_foreign_key "bookings", "products"
  add_foreign_key "bookings", "users"
  add_foreign_key "branches", "companies"
  add_foreign_key "company_products", "companies"
  add_foreign_key "company_products", "products"
  add_foreign_key "foremen", "branches"
  add_foreign_key "framework_contracts", "companies"
  add_foreign_key "framework_contracts", "products"
  add_foreign_key "framework_contracts", "service_providers"
  add_foreign_key "managers", "service_providers"
  add_foreign_key "option_choices", "option_groups"
  add_foreign_key "option_values", "options"
  add_foreign_key "product_options", "options"
  add_foreign_key "product_options", "products"
  add_foreign_key "product_questions", "products"
  add_foreign_key "product_questions", "questions"
  add_foreign_key "questions", "option_groups"
  add_foreign_key "questions", "sections"
  add_foreign_key "questions", "units"
  add_foreign_key "reports", "bookings"
  add_foreign_key "technicians", "service_providers"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "companies"
end
