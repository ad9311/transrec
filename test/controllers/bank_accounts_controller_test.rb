require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bank_accounts_index_url
    assert_response :success
  end

  test 'should get show' do
    get bank_accounts_show_url
    assert_response :success
  end

  test 'should get new' do
    get bank_accounts_new_url
    assert_response :success
  end
end
