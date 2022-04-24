class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :cycles

  enum :sort, { savings: 0, checking: 1 }
end
