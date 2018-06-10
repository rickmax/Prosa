class CreateProposta < ActiveRecord::Migration
  def change
    create_table :proposta do |t|
      t.string :nome
      t.text :descricao
      t.decimal :valor
      t.date :inicio
      t.date :fim
      t.string :stado
      t.string :cidade

      t.timestamps null: false
    end
  end
end
