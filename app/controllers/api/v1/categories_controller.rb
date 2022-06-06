class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /categories
  def index
    @categories = current_user.categories
    @expenses = current_user.funds.where(type_declaration: 'expenses').order(date: :desc).limit(10)
    @incomes = current_user.funds.where(type_declaration: 'incomes').order(date: :desc).limit(10)
    @funds_titles = current_user.funds.pluck(:title)

    render json: {
      categories: @categories.as_json(
        methods: %i[sum_funds last_funds]
      ),
      expenses: @expenses,
      incomes: @incomes
    }
  end

  # GET /categories/1
  def show
    @funds = @category.funds
    render json: @category.as_json(include: :funds)
  end

  # POST /categories
  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title, :money, :user_id, :person_id, :icon, :color, persons_array: [])
  end
end
