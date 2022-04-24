class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :cycle, null: false, foreign_key: true
      t.integer :category
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
