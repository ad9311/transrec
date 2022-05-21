# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  amount      :float
#  category    :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cycle_id    :bigint           not null
#
# Indexes
#
#  index_transactions_on_cycle_id  (cycle_id)
#
# Foreign Keys
#
#  fk_rails_...  (cycle_id => cycles.id)
#
class Transaction < ApplicationRecord
  validates :description, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: true
  belongs_to :cycle

  enum :category, {
    deposit: 0,
    groceries: 1,
    video_games: 2,
    online_shopping: 3,
    other: 4
  }
end
