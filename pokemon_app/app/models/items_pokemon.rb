class ItemsPokemon < ApplicationRecord
    belongs_to :pokemon
    belongs_to :item

    scope :by_pokemon_name, ->(pokemon_id) {
        list = pokemon_id ? where("pokemon_id = ?", pokemon_id) : all
        list.joins(:pokemon).order("pokemons.name ASC, item_id ASC")
    }

    validates :pokemon_id, uniqueness: { scope: :item_id, :message => "already has this Item." }
end
