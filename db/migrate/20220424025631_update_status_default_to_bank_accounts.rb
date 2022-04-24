class UpdateStatusDefaultToBankAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bank_accounts, :balance, from: nil, to: 0.0
  end
end
