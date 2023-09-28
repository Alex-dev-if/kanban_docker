class CriarColunas < ActiveRecord::Migration[7.0]
  def change
    create_table :colunas do |t|
      t.integer :todo
      t.integer :doing
      t.integer :done
    end
end
end