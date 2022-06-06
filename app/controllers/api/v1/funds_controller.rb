class Api::V1::FundsController < ApplicationController
  before_action :set_fund, only: %i[show update destroy]

  # GET /funds
  def index
    # sort by type_operation
    @funds = current_user.funds.order(type_operation: :desc)
    @expenses = current_user.funds.where(type_declaration: 'expenses').order(date: :desc).limit(10)
    @incomes = current_user.funds.where(type_declaration: 'incomes').order(date: :desc).limit(10)

    render json: {
      funds: @funds,
      expenses: @expenses,
      incomes: @incomes
    }
  end

  # GET /funds/1
  def show
    render json: @fund
  end

  # POST /funds
  def create
    @fund = current_user.funds.new(fund_params)

    if @fund.save
      render json: @fund, status: :created, location: @fund
    else
      render json: @fund.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /funds/1
  def update
    # debugger
    if @fund.update(fund_params)
      render json: @fund
    else
      render json: @fund.errors, status: :unprocessable_entity
    end
  end

  # DELETE /funds/1
  def destroy
    @fund.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fund
    @fund = Fund.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fund_params
    params.require(:fund).permit(:title, :amount, :type_operation, :date, :category_id, :note, :type_declaration,
                                 :icon)
  end
end
