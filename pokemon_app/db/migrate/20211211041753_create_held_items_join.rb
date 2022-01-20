# frozen_string_literal: true

class CreateHeldItemsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :items_pokemons do |t|
      t.integer 'pokemon_id'
      t.integer 'item_id'
      t.timestamps
    end

    add_index('items_pokemons', %w[pokemon_id item_id])
  end

  def down
    drop_table :items_pokemons
  end
end
