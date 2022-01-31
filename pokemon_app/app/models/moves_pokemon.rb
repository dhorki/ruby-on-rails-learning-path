# frozen_string_literal: true

class MovesPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :move

  scope :by_pokemon_name, lambda { |pokemon_id|
    list = pokemon_id ? where('pokemon_id = ?', pokemon_id) : all
    list.joins(:pokemon).order('pokemons.name ASC, move_id ASC')
  }

  validates :pokemon_id, uniqueness: { scope: :move_id, message: 'already has this Move.' }
end
