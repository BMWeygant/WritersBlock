class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :genre
      t.text :synopsis
      t.integer :writer_id
    end
  end
end
