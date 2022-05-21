# == Schema Information
#
# Table name: cycles
#
#  id              :bigint           not null, primary key
#  balance         :float            default(0.0)
#  month           :integer
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bank_account_id :bigint           not null
#
# Indexes
#
#  index_cycles_on_bank_account_id  (bank_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_account_id => bank_accounts.id)
#
class Cycle < ApplicationRecord
  belongs_to :bank_account
  has_many :transactions, dependent: :destroy

  enum :month, {
    january: 1,
    february: 2,
    march: 3,
    april: 4,
    may: 5,
    june: 6,
    july: 7,
    august: 8,
    september: 9,
    october: 10,
    november: 11,
    december: 12
  }

  scope :current, -> { where(month: Time.new.getlocal.mon, year: Time.new.getlocal.year).first }

  def new_transaction(amount)
    update(balance: (balance + amount))
    bank_account.update(balance: (bank_account.balance + amount))
  end
end
