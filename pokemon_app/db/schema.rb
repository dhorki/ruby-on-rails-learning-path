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
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "abilities_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "ability_id"
    t.boolean "is_hidden", default: false
    t.integer "slot", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id", "pokemon_id"], name: "index_abilities_pokemons_on_ability_id_and_pokemon_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "forms_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "form_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "form_id"], name: "index_forms_pokemons_on_pokemon_id_and_form_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "item_id"], name: "index_items_pokemons_on_pokemon_id_and_item_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "move_id"], name: "index_moves_pokemons_on_pokemon_id_and_move_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "base_experience", default: 0
    t.integer "height", default: 0
    t.integer "pokeapi_id", default: 0
    t.boolean "is_default", default: false
    t.string "name", default: ""
    t.integer "order", default: 0
    t.integer "weight", default: 0
    t.integer "species_id", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_custom", default: false
  end

  create_table "pokemons_stats", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "stat_id"
    t.integer "base_stat", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "stat_id"], name: "index_pokemons_stats_on_pokemon_id_and_stat_id"
  end

  create_table "pokemons_types", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "type_id"
    t.integer "slot", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sprites", force: :cascade do |t|
    t.integer "pokemon_id"
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
  end

  create_table "stats", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name", default: ""
    t.string "url", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 25, null: false
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
