class CreateCnaes < ActiveRecord::Migration[5.1]
  def change
    create_table :cnaes do |t|
      t.references :type
      t.string :date
      t.string :value
      t.string :cpf
      t.string :card
      t.string :time

      t.timestamps
    end
  end
end
