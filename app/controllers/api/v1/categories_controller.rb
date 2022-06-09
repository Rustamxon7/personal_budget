class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /categories
  def index
    @categories = current_user.categories

    render json: @categories, each_serializer: CategorySerializer
  end

  # GET /categories/1
  def show
    render json: @category
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
    params.require(:category).permit(:title, :money, :person_id, :icon, persons_array: [])
  end
end
