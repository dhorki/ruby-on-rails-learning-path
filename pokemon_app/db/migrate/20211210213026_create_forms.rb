# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[6.1]
  def up
    create_table :forms do |t|
      t.string 'name', default: '', index: {unique: true}, null: false
      t.string 'url', default: ''

      t.timestamps
    end
  end

  def down
    drop_table :forms
  end
end
