# frozen_string_literal: true

class Stat < ApplicationRecord
  has_many :pokemons_stats, dependent: :destroy
  has_many :pokemons, through: :pokemons_stats

  scope :alpha_sorted, -> { order('name ASC') }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
