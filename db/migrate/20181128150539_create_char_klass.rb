class CreateCharKlass < ActiveRecord::Migration[5.2]
  def change
    create_table :char_klasses do |t|
      t.references :char, foreign_key: true
      t.references :klass, foreign_key: true
    end
  end
end
