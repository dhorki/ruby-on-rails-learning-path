# frozen_string_literal: true

class Form < ApplicationRecord
  has_many :forms_pokemons, dependent: :destroy
  has_many :pokemons, through: :forms_pokemons

  scope :alpha_sorted, -> { order('name ASC') }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
