# frozen_string_literal: true

class CreatePokemonsTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_types do |t|
      t.references :pokemon, foreign_key: true
      t.references :type, foreign_keys: true
      t.integer 'slot', default: 0
      t.timestamps
    end
  end

  def down
    drop_table :pokemons_types
  end
end
