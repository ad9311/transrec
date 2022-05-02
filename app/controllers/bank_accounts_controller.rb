class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[show]

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def show
    @cycle = new_cycle
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.build(bank_account_params)
    respond_to do |format|
      format.turbo_stream
      if @bank_account.save
        flash.now[:notice] = 'Bank account added'
      else
        flash.now[:alert] = @bank_account.errors.full_messages
      end
    end
  end

  def change_cycle
    cycle_params
    render partial: "bank_accounts/transactions"
  end

  private

  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end

  def bank_account_params
    params.require(:bank_account).permit(:bank, :last_four, :sort)
  end

  def cycle_params
    @bank_account = BankAccount.find(params[:bank_account_id])
    @cycle = Cycle.find(params[:cycle_id])
  end

  def new_cycle
    cycle = @bank_account.cycles.current
    if cycle.blank?
      cycle = Cycle.new(
        bank_account_id: @bank_account.id,
        month: Time.new.getlocal.mon,
        year: Time.new.getlocal.year
      )
      return cycle if cycle.save

      Cycle.new
    else
      cycle.first
    end
  end
end
