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

ActiveRecord::Schema.define(version: 20180303104856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boards_count", default: 0, null: false
    t.index ["owner_id"], name: "index_accounts_on_owner_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.integer "cards_count", default: 0, null: false
    t.string "slug"
    t.integer "number"
    t.index ["account_id"], name: "index_boards_on_account_id"
  end

  create_table "card_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_users_on_card_id"
    t.index ["user_id"], name: "index_card_users_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "slug"
    t.integer "number"
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.bigint "checklist_id"
    t.bigint "creator_id"
    t.bigint "completed_by_id"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "timer_id"
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
    t.index ["completed_by_id"], name: "index_checklist_items_on_completed_by_id"
    t.index ["creator_id"], name: "index_checklist_items_on_creator_id"
    t.index ["timer_id"], name: "index_checklist_items_on_timer_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "creator_id"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_checklists_on_card_id"
    t.index ["creator_id"], name: "index_checklists_on_creator_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "board_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["board_id"], name: "index_lists_on_board_id"
  end

  create_table "team_boards", force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_team_boards_on_board_id"
    t.index ["team_id"], name: "index_team_boards_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "account_id"
    t.jsonb "permissions", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_teams_on_account_id"
  end

  create_table "timers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "card_id"
    t.string "status"
    t.integer "seconds", default: 0, null: false
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_timers_on_card_id"
    t.index ["user_id"], name: "index_timers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
