# frozen_string_literal: true

class CreateSprites < ActiveRecord::Migration[6.1]
  def up
    create_table :sprites do |t|
      t.references :pokemon, foreign_key: true
      t.string 'back_default'
      t.string 'back_female'
      t.string 'back_shiny'
      t.string 'back_shiny_female'
      t.string 'front_default'
      t.string 'front_female'
      t.string 'front_shiny'
      t.string 'front_shiny_female'
      t.string 'official_artwork_front_default'
      t.timestamps
    end
  end

  def down
    drop_table :sprites
  end
end
