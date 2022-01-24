# frozen_string_literal: true

class CreateFormsPokemonsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :forms_pokemons do |t|
      t.references :pokemon, foreign_key: true
      t.references :form, foreign_keys: true
      t.timestamps
    end
  end

  def down
    drop_table :forms_pokemons
  end
end
