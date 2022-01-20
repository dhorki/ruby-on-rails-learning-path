# frozen_string_literal: true

class AddPokemonIsCustomField < ActiveRecord::Migration[6.1]
  def up
    add_column(:pokemons, 'is_custom', :boolean, default: false)
  end
end
