require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new_deposit' do
    get transactions_new_deposit_url
    assert_response :success
  end

  test 'should get new_expense' do
    get transactions_new_expense_url
    assert_response :success
  end
end
