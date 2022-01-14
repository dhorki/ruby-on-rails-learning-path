class FormsPokemon < ApplicationRecord
    belongs_to :pokemon
    belongs_to :form

    scope :by_pokemon_name, ->(pokemon_id) {
        list = pokemon_id ? where("pokemon_id = ?", pokemon_id) : all
        list.joins(:pokemon).order("pokemons.name ASC, form_id ASC")
    }

    validates :pokemon_id, uniqueness: { scope: :form_id, :message => "already has this Form." }
end
