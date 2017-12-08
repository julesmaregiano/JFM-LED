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

ActiveRecord::Schema.define(version: 20171208173143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.boolean "status"
    t.integer "half"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_availabilities_on_booking_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address1"
    t.datetime "confirmed_at"
    t.text "comment"
    t.string "surface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.bigint "foreman_id"
    t.index ["foreman_id"], name: "index_bookings_on_foreman_id"
    t.index ["report_id"], name: "index_bookings_on_report_id"
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
    t.index ["option_group_id"], name: "index_questions_on_option_group_id"
    t.index ["section_id"], name: "index_questions_on_section_id"
    t.index ["unit_id"], name: "index_questions_on_unit_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "option_choices"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "reports"
  add_foreign_key "availabilities", "bookings"
  add_foreign_key "availabilities", "users"
  add_foreign_key "bookings", "reports"
  add_foreign_key "bookings", "users"
  add_foreign_key "branches", "companies"
  add_foreign_key "foremen", "branches"
  add_foreign_key "option_choices", "option_groups"
  add_foreign_key "questions", "option_groups"
  add_foreign_key "questions", "sections"
  add_foreign_key "questions", "units"
end
