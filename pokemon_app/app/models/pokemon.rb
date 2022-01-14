class Pokemon < ApplicationRecord
  belongs_to :species

  has_one :sprite

  has_many :forms_pokemons, :dependent => :destroy
  has_many :forms, :through => :forms_pokemons

  has_and_belongs_to_many :items
  has_and_belongs_to_many :moves

  has_many :abilities_pokemons, :dependent => :destroy
  has_many :abilities, :through => :abilities_pokemons

  has_many :pokemons_stats, :dependent => :destroy
  has_many :stats, :through => :pokemons_stats

  has_many :pokemons_types, :dependent => :destroy
  has_many :types, :through => :pokemons_types


  scope :sorted, lambda { order("created_at DESC") }
  scope :alpha_sorted, lambda { order("name ASC") }

  # validates_numericality_of :base_experience, :only_integer => true
  # validates_numericality_of :height, :greater_than => 0, :only_integer => true
  #
  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  #
  # validates_numericality_of :order, :greater_than => 0, :only_integer => true
  # validates_numericality_of :weight, :only_integer => true

  validates :base_experience,  numericality: { only_integer: true }
  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
  validates :order, numericality: { greater_than: 0, only_integer: true }
  validates :weight, numericality: { only_integer: true }
end
