# frozen_string_literal: true

class CreateAbilitiesPokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities_pokemons do |t|
      t.integer 'pokemon_id'
      t.integer 'ability_id'
      t.boolean 'is_hidden', default: false
      t.integer 'slot', default: 0
      t.timestamps
    end

    add_index('abilities_pokemons', %w[ability_id pokemon_id])
  end

  def down
    drop_table :abilities_pokemons
  end
end
