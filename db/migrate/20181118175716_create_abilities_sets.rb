class CreateAbilitiesSets < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities_sets do |t|
      t.belongs_to :char, index: {unique: true}, foreign_key: true
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
    end
  end
end
