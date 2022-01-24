# frozen_string_literal: true

class CreatePokemonsStats < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_stats do |t|
      t.references :pokemon, foreign_key: true
      t.references :stat, foreign_keys: true
      t.integer 'base_stat', default: 0
      t.timestamps
    end
  end

  def down
    drop_table :pokemons_stats
  end
end
