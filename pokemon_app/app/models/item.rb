# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :items_pokemons, dependent: :destroy
  has_many :pokemons, through: :items_pokemons

  scope :alpha_sorted, -> { order('name ASC') }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
