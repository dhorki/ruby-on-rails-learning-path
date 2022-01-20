# frozen_string_literal: true

class CreateStats < ActiveRecord::Migration[6.1]
  def up
    create_table :stats do |t|
      t.string 'name', default: ''
      t.string 'url', default: ''
      t.timestamps
    end
  end

  def down
    drop_table :stats
  end
end
