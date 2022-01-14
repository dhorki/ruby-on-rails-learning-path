class PokemonsStat < ApplicationRecord
  belongs_to :pokemon
  belongs_to :stat

  scope :by_pokemon_name, ->(pokemon_id) {
    list = pokemon_id ? where("pokemon_id = ?", pokemon_id) : all
    list.joins(:pokemon).order("pokemons.name ASC, stat_id ASC")
  }

  # validates_numericality_of :base_stat, only_integer: true

  validates :pokemon_id, uniqueness: { scope: :stat_id, :message => "already has this Stat." }
  validates :base_stat, numericality: { only_integer: true }
end
