class Species < ApplicationRecord
  has_many :pokemons

  scope :alpha_sorted, lambda { order("name ASC") }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
