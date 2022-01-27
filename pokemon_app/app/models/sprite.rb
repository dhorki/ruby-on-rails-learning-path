# frozen_string_literal: true

class Sprite < ApplicationRecord
  belongs_to :pokemon

  scope :by_pokemon_name, lambda { |pokemon_id|
    list = pokemon_id ? where('pokemon_id = ?', pokemon_id) : all
    list.joins(:pokemon).order('name ASC')
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

  URL_REGEX = %r/.{}|(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix

  validates :pokemon_id, presence: true, uniqueness: true
  validates :back_default, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :back_female, length: { maximum: 255, allow_blank: true }, format: {  with: URL_REGEX, allow_blank: true }
  validates :back_shiny, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :back_shiny_female, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :front_default, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :front_female, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :front_shiny, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :front_shiny_female, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
  validates :official_artwork_front_default, length: { maximum: 255, allow_blank: true }, format: { with: URL_REGEX, allow_blank: true }
end
