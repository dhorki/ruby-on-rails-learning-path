class Sprite < ApplicationRecord
  belongs_to :pokemon

  scope :by_pokemon_name, ->(pokemon_id) {
    list = pokemon_id ? where("pokemon_id = ?", pokemon_id) : all
    list.joins(:pokemon).order("name ASC")
  }


  # validates_length_of :back_default, :maximum => 255, :allow_blank => true
  # validates_length_of :ack_female, :maximum => 255, :allow_blank => true
  # validates_length_of :back_shiny, :maximum => 255, :allow_blank => true
  # validates_length_of :back_shiny_female, :maximum => 255, :allow_blank => true
  # validates_length_of :front_default, :maximum => 255, :allow_blank => true
  # validates_length_of :front_female, :maximum => 255, :allow_blank => true
  # validates_length_of :front_shiny, :maximum => 255, :allow_blank => true
  # validates_length_of :front_shiny_female, :maximum => 255, :allow_blank => true
  # validates_length_of :official_artwork_front_default, :maximum => 255, :allow_blank => true

  validates :pokemon_id, presence: true, uniqueness: true
  validates :back_default, length: { :maximum => 255, :allow_blank => true }
  validates :back_female, length: { :maximum => 255, :allow_blank => true }
  validates :back_shiny, length: { :maximum => 255, :allow_blank => true }
  validates :back_shiny_female, length: { :maximum => 255, :allow_blank => true }
  validates :front_default, length: { :maximum => 255, :allow_blank => true }
  validates :front_female, length: { :maximum => 255, :allow_blank => true }
  validates :front_shiny, length: { :maximum => 255, :allow_blank => true }
  validates :front_shiny_female, length: { :maximum => 255, :allow_blank => true }
  validates :official_artwork_front_default, length: { :maximum => 255, :allow_blank => true }
end
