class CreateChars < ActiveRecord::Migration[5.2]
  def change
    create_table :chars do |t|
      t.string :name
      t.integer :user_id
      t.string :klass
      t.integer :lvl
      t.string :school
      t.text :notes
    end
  end
end
