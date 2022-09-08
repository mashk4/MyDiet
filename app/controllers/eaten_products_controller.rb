class EatenProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_eaten_product, only: %i[show edit update destroy send_report]
  before_action :fetch_meals, only: %i[new edit update]
  before_action :authorize_eaten_product!
  after_action :verify_authorized

  def index
    @eaten_products = current_user.eaten_products.search_by_day(params[:search_by_day])
  end

  def show; end

  def new
    @eaten_product = current_user.eaten_products.new
  end

  def create
    @eaten_product = current_user.eaten_products.build(create_eaten_product_params)
    if @eaten_product.save
      flash[:success] = 'Eaten meals list was successfully added!'
      redirect_to eaten_product_path(@eaten_product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @eaten_product.update(update_eaten_product_params)
      flash[:success] = 'Eaten meals list was successfully updated!'
      redirect_to eaten_product_path(@eaten_product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @eaten_product.destroy
    flash[:success] = 'Eaten meals list was successfully deleted!'

    redirect_to eaten_products_path
  end

  def send_report
    ReportJob.perform_later(@eaten_product, current_user)

    flash[:success] = 'Email with report was successfully sent!'

    redirect_to eaten_products_path
  end

  private

  def create_eaten_product_params
    params.require(:eaten_product).permit(:eaten_at, :search_by_day, meal_ids: [])
    .merge(user: current_user)
  end

  def update_eaten_product_params
    params.require(:eaten_product).permit(:eaten_at, :search_by_day, meal_ids: [])
  end

  def find_eaten_product
    @eaten_product = current_user.eaten_products.find(params[:id])
  end

  def fetch_meals
    @meals = Meal.all
  end

  def authorize_eaten_product!
    authorize(@eaten_product || EatenProduct)
  end
end
