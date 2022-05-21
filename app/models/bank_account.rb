# == Schema Information
#
# Table name: bank_accounts
#
#  id         :bigint           not null, primary key
#  balance    :float            default(0.0)
#  bank       :string
#  last_four  :string
#  sort       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bank_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class BankAccount < ApplicationRecord
  validates :bank, presence: true, length: { maximum: 15 }
  validates :last_four, presence: true, length: { maximum: 4 }, numericality: true

  belongs_to :user
  has_many :cycles, dependent: :destroy

  enum :sort, { savings: 0, checking: 1 }
end
