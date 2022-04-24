class CreateCycles < ActiveRecord::Migration[7.0]
  def change
    create_table :cycles do |t|
      t.references :bank_account, null: false, foreign_key: true
      t.integer :month
      t.integer :year
      t.float :balance

      t.timestamps
    end
  end
end
