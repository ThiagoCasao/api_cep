class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.string :codigo_ibge
      t.belongs_to :estado, foreign_key: true

      t.timestamps
    end
  end
end
