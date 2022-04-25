class BankAccount < ApplicationRecord
  validates :bank, presence: true, length: { maximum: 15 }
  validates :last_four, presence: true, length: { maximum: 4 }, numericality: true

  belongs_to :user
  has_many :cycles, dependent: :destroy

  enum :sort, { savings: 0, checking: 1 }
end
