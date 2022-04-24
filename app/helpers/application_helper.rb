module ApplicationHelper
  def format_balance(balance)
    number_to_currency balance, precision: 2
  end
end
