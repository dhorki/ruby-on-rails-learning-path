# frozen_string_literal: true

class AbilitiesPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability

  scope :by_pokemon_name, lambda { |pokemon_id|
    list = pokemon_id ? where('pokemon_id = ?', pokemon_id) : all
    list.joins(:pokemon).order('pokemons.name ASC, slot ASC')
  }

  # validates_numericality_of :slot, :greater_than => 1, :only_integer => true

  validates :slot, numericality: { greater_than: 0, only_integer: true }
  validates :pokemon_id, uniqueness: { scope: :slot, message: 'already has this Slot occupied.' }
  validates :pokemon_id, uniqueness: { scope: :ability_id, message: 'already has this Ability.' }
end
