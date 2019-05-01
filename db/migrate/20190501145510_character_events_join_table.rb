class CharacterEventsJoinTable < ActiveRecord::Migration
  def change
    create_table do |t|
      t.integer :char_id
      t.integer :event_id
    end
  end
end
