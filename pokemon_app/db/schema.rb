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

ActiveRecord::Schema.define(version: 2021_12_21_194017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_abilities_on_name", unique: true
  end

  create_table "abilities_pokemons", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "ability_id"
    t.boolean "is_hidden", default: false
    t.integer "slot", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id"], name: "index_abilities_pokemons_on_ability_id"
    t.index ["pokemon_id"], name: "index_abilities_pokemons_on_pokemon_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_forms_on_name", unique: true
  end

  create_table "forms_pokemons", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "form_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_forms_pokemons_on_form_id"
    t.index ["pokemon_id"], name: "index_forms_pokemons_on_pokemon_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "items_pokemons", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_items_pokemons_on_item_id"
    t.index ["pokemon_id"], name: "index_items_pokemons_on_pokemon_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_moves_on_name", unique: true
  end

  create_table "moves_pokemons", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_moves_pokemons_on_move_id"
    t.index ["pokemon_id"], name: "index_moves_pokemons_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "base_experience", default: 0
    t.integer "height", default: 0
    t.integer "pokeapi_id", default: 0
    t.boolean "is_default", default: false
    t.string "name", default: "", null: false
    t.integer "order", default: 0
    t.integer "weight", default: 0
    t.integer "species_id", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_custom", default: false, null: false
    t.index ["name"], name: "index_pokemons_on_name", unique: true
  end

  create_table "pokemons_stats", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "stat_id"
    t.integer "base_stat", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemons_stats_on_pokemon_id"
    t.index ["stat_id"], name: "index_pokemons_stats_on_stat_id"
  end

  create_table "pokemons_types", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "type_id"
    t.integer "slot", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemons_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemons_types_on_type_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_species_on_name", unique: true
  end

  create_table "sprites", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.string "back_default"
    t.string "back_female"
    t.string "back_shiny"
    t.string "back_shiny_female"
    t.string "front_default"
    t.string "front_female"
    t.string "front_shiny"
    t.string "front_shiny_female"
    t.string "official_artwork_front_default"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_sprites_on_pokemon_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_stats_on_name", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_types_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 25, null: false
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "abilities_pokemons", "pokemons"
  add_foreign_key "forms_pokemons", "pokemons"
  add_foreign_key "items_pokemons", "pokemons"
  add_foreign_key "moves_pokemons", "pokemons"
  add_foreign_key "pokemons_stats", "pokemons"
  add_foreign_key "pokemons_types", "pokemons"
  add_foreign_key "sprites", "pokemons"
end
