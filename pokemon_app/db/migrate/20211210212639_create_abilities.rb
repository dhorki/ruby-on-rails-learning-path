# frozen_string_literal: true

class CreateAbilities < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities do |t|
      t.string 'name', default: '', index: {unique: true}, null: false
      t.string 'url', default: ''

      t.timestamps
    end
  end

  def down
    drop_table :abilities
  end
end
