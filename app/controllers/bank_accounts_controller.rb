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
      if @bank_account.save
        format.html { redirect_to root_path, notice: 'Created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end

  def bank_account_params
    params.require(:bank_account).permit(:bank, :last_four, :sort)
  end

  def new_cycle
    cycle = @bank_account.cycles.current
    if cycle.blank?
      cycle = Cycle.new(
        bank_account_id: @bank_account.id,
        month: Time.new.getlocal.mon,
        year: Time.new.getlocal.year
      )
      cycle if cycle.save
    else
      cycle
    end
  end
end
