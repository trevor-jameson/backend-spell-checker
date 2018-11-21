class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :api_id
      t.integer :api_index
      t.string :name
      t.text :desc
      t.text :highlvl
      t.string :page
      t.string :range
      t.string :components
      t.boolean :ritual
      t.boolean :concentration
      t.string :duration
      t.string :castingtime
      t.string :material
      t.integer :lvl
      t.string :school
      t.string :classes
      t.string :url
    end
  end
end
