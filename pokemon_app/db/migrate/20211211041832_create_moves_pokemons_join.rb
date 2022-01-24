# frozen_string_literal: true

class CreateMovesPokemonsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :moves_pokemons do |t|
      t.references :pokemon, foreign_key: true
      t.references :move, foreign_keys: true
      t.timestamps
    end
  end

  def down
    drop_table :moves_pokemons
  end
end
