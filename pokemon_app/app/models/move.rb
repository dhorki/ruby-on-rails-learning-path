# frozen_string_literal: true

class Move < ApplicationRecord
  has_many :moves_pokemons, dependent: :destroy
  has_many :pokemons, through: :moves_pokemons

  scope :alpha_sorted, -> { order('name ASC') }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
