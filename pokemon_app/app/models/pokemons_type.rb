class PokemonsType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  scope :by_pokemon_name, ->(pokemon_id) {
    list = pokemon_id ? where("pokemon_id = ?", pokemon_id) : all
    list.joins(:pokemon).order("pokemons.name ASC, slot ASC")
  }

  # validates_numericality_of :slot, :greater_than => 0, :only_integer => true

  validates :slot, numericality: { greater_than: 0, only_integer: true }
  validates :pokemon_id, uniqueness: { scope: :slot, :message => "already has this Slot occupied." }
  validates :pokemon_id, uniqueness: { scope: :type_id, :message => "already has this Type." }
end
