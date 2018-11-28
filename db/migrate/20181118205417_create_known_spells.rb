class CreateKnownSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :known_spells do |t|
      t.references :spells, foreign_key: true
      t.references :chars , foreign_key: true

      t.timestamps
    end
  end
end
