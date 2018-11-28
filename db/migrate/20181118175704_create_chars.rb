class CreateChars < ActiveRecord::Migration[5.2]
  def change
    create_table :chars do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :abilities_set, foreign_key: true
      t.string :school
      t.text :notes
    end
  end
end
