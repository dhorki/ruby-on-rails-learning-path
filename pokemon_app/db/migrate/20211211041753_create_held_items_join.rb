# frozen_string_literal: true

class CreateHeldItemsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :items_pokemons do |t|
      t.references :pokemon, foreign_key: true
      t.references :item, foreign_keys: true
      t.timestamps
    end
  end

  def down
    drop_table :items_pokemons
  end
end
