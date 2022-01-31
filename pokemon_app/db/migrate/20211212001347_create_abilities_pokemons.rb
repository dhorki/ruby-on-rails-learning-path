# frozen_string_literal: true

class CreateAbilitiesPokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities_pokemons do |t|
      t.references :pokemon, foreign_key: true
      t.references :ability, foreign_keys: true
      t.boolean 'is_hidden', default: false
      t.integer 'slot', default: 0
      t.timestamps
    end
  end

  def down
    drop_table :abilities_pokemons
  end
end
