class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :role
      t.text :biography
      t.integer :story_id
      t.integer :user_id
    end
  end
end
