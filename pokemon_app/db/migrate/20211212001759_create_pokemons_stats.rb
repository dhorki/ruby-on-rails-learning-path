# frozen_string_literal: true

class CreatePokemonsStats < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_stats do |t|
      t.integer 'pokemon_id'
      t.integer 'stat_id'
      t.integer 'base_stat', default: 0
      t.timestamps
    end

    add_index('pokemons_stats', %w[pokemon_id stat_id])
  end

  def down
    drop_table :pokemons_stats
  end
end
