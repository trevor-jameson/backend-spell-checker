class AddColumnToCharKlasses < ActiveRecord::Migration[5.2]
  def change
    add_column :char_klasses, :klass_lvl, :integer
  end
end
