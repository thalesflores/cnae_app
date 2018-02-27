class CreateCnaes < ActiveRecord::Migration[5.1]
  def change
    create_table :cnaes do |t|
      t.string :type, limit: 1
      t.date :date
      t.string :value
      t.string :cpf, limit: 11
      t.string :card, limit: 12
      t.time :time

      t.timestamps
    end
  end
end
