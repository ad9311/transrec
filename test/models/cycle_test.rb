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
require 'test_helper'

class CycleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
