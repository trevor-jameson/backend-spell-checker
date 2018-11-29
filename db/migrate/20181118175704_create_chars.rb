class CreateChars < ActiveRecord::Migration[5.2]
  def change
    create_table :chars do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :health
      t.text :notes
    end
  end
end
