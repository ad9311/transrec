class UpdateStatusDefaultToCycles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cycles, :balance, from: nil, to: 0.0
  end
end
