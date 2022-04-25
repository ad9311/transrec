module ApplicationHelper
  def format_balance(balance)
    number_to_currency balance, precision: 2
  end

  def current_user_balance
    balance = 0.0
    current_user.bank_accounts.each do |bank_account|
      balance += bank_account.balance
    end
    balance
  end

  def map_enum(enum, skip = nil)
    map = []
    enum.each do |k, v|
      map << [k.to_s.tr('_', ' ').capitalize, k] unless skip == k
    end
    map
  end
end
