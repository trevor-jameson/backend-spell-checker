class CreateKlass < ActiveRecord::Migration[5.2]
  def change
    create_table :klasses do |t|
      t.string :api_id
      t.string :name
      t.integer :hitdie
    end
  end
end
