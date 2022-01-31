# frozen_string_literal: true

class Pokemon < ApplicationRecord
  belongs_to :species

  has_one :sprite

  has_many :forms_pokemons, dependent: :destroy
  has_many :forms, through: :forms_pokemons

  has_many :items_pokemons
  has_many :items, through: :items_pokemons

  has_many :moves_pokemons
  has_many :moves, through: :moves_pokemons

  has_many :abilities_pokemons, dependent: :destroy
  has_many :abilities, through: :abilities_pokemons

  has_many :pokemons_stats, dependent: :destroy
  has_many :stats, through: :pokemons_stats

  has_many :pokemons_types, dependent: :destroy
  has_many :types, through: :pokemons_types

  scope :sorted, -> { order('created_at DESC') }
  scope :alpha_sorted, -> { order('name ASC') }

  # validates_numericality_of :base_experience, :only_integer => true
  # validates_numericality_of :height, :greater_than => 0, :only_integer => true
  #
  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  #
  # validates_numericality_of :order, :greater_than => 0, :only_integer => true
  # validates_numericality_of :weight, :only_integer => true

  validates :base_experience, numericality: { only_integer: true }
  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
  validates :order, numericality: { greater_than: 0, only_integer: true }
  validates :weight, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :height, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
