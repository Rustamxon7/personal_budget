class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[show update destroy]

  # GET /people
  def index
    @people = current_user.people.all.order(:name)
    @categories = current_user.categories.all.order(:name)
    render json: @people.as_json(include: :categories)
  end

  # GET /people/1
  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  # POST /people
  def create
    @person = current_user.people.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:name, :icon, :user_id)
  end
end
