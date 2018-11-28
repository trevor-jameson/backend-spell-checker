class CreateSpellSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :spell_slots do |t|
      t.references :klass, foreign_key: true
      t.references :level, foreign_key: true
      t.integer :slot0
      t.integer :slot1
      t.integer :slot2
      t.integer :slot3
      t.integer :slot4
      t.integer :slot5
      t.integer :slot6
      t.integer :slot7
      t.integer :slot8
      t.integer :slot9
    end
  end
end
