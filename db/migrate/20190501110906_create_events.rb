class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.datetime :chronological_order
      t.integer :story_id
      t.integer :writer_id
    end
  end
end
