class CreatePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons do |t|
      t.integer "base_experience", :default => 0
      t.integer "height", :default => 0
      t.integer "pokeapi_id", :default => 0
      t.boolean "is_default", :default => false
      t.string "name", :default => ""
      t.integer "order", :default => 0
      t.integer "weight", :default => 0
      t.integer "species_id", :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :pokemons
  end
end
