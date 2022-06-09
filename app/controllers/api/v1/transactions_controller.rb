class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show update destroy]

  # GET /transactions
  def index
    @transactions = current_user.funds.last_funds(10)
    @expenses = current_user.funds.last_funds_by_type('expenses', 10)
    @incomes = current_user.funds.last_funds_by_type('incomes', 10)

    render json: {
      transactions: @transactions,
      expenses: @expenses,
      incomes: @incomes
    }
  end
end
