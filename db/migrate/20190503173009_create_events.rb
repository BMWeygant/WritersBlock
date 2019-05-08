class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.integer :story_id
      t.integer :user_id
    end
  end
end
