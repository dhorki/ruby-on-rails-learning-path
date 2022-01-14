class CreateItems < ActiveRecord::Migration[6.1]
  def up
    create_table :items do |t|
      t.string "name", :default => ""
      t.string "url", :default => ""
      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
