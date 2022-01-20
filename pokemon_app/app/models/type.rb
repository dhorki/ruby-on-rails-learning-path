# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :pokemons_types, dependent: :destroy
  has_many :pokemons, through: :pokemons_types

  scope :alpha_sorted, -> { order('name ASC') }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
