# frozen_string_literal: true

class CreatePokemonsTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_types do |t|
      t.integer 'pokemon_id'
      t.integer 'type_id'
      t.integer 'slot', default: 0
      t.timestamps
    end

    add_index('pokemons_types', %w[pokemon_id type_id])
  end

  def down
    drop_table :pokemons_types
  end
end
