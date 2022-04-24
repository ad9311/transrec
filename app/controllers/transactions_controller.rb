class TransactionsController < ApplicationController
  before_action :set_cycle, only: %i[new_deposit new_expense]

  def new_deposit
    @transaction = Transaction.new
  end

  def new_expense
    @transaction = Transaction.new
  end

  def create
    cycle = Cycle.find(transaction_params[:cycle_id])
    @transaction = cycle.transactions.build(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to cycle.bank_account, notice: 'Created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find(params[:id])
  end

  def transaction_params
    new_params = params.require(:transaction).permit(:cycle_id, :category, :description, :amount)
    new_params[:amount] = (new_params[:amount].to_i * -1).to_s unless new_params[:category] == 'deposit'
    new_params
  end
end
