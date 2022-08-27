class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_diet, only: %i[show edit update destroy]

  def index
    @diets = current_user.diets.search(params[:search])
  end

  def show; end

  def new
    @diet = current_user.diets.new
  end

  def create
    @diet = current_user.diets.build(create_diet_params)
    if @diet.save
      flash[:success] = 'Diet was successfully created!'
      redirect_to diets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @diet.update(update_diet_params)
      flash[:success] = 'Diet was successfully updated!'
      redirect_to diets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diet.destroy
    flash[:success] = 'Diet was successfully deleted!'

    redirect_to diets_path
  end

  private

  def create_diet_params
    params.require(:diet).permit(:name, :date, :search).merge(user: current_user)
  end

  def update_diet_params
    params.require(:diet).permit(:name, :date, :search)
  end

  def find_diet
    @diet = current_user.diets.find(params[:id])
  end
end
