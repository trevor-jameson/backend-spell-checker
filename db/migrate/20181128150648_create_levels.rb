class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :api_id
      t.integer :asbonus
      t.string :features
      t.integer :profbonus
    end
  end
end
