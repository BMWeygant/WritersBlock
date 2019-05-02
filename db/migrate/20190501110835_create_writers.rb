class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :username
      t.string :name
      t.text :email
      t.text :website
      t.string :password_digest
    end
  end
end
