# frozen_string_literal: true

class CreateFormsPokemonsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :forms_pokemons do |t|
      t.integer 'pokemon_id'
      t.integer 'form_id'
      t.timestamps
    end

    add_index('forms_pokemons', %w[pokemon_id form_id])
  end

  def down
    drop_table :forms_pokemons
  end
end
