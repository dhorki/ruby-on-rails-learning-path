# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :types do |t|
      t.string 'name', default: '', index: {unique: true}, null: false
      t.string 'url', default: ''
      t.timestamps
    end
  end

  def down
    drop_table :types
  end
end
