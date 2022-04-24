# frozen_string_literal: true

class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :bank
      t.string :last_four
      t.float :balance
      t.integer :sort
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
