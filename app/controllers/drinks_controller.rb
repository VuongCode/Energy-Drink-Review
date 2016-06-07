class DrinksController < ApplicationController
  before_action :find_drink, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :edit, :show, :new, :create, :destroy]

  def index
    @drinks = Drink.all
    if params[:search]
      @drinks = Drink.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @drinks = Drink.all.order('created_at DESC').page params[:page]
    end
  end

  def show
    @reviews = Review.where(drink_id: @drink)
  end

  def new
    @drink = current_user.drinks.build
  end

  def create
    @drink = current_user.drinks.build(drink_params)

    if @drink.save
      redirect_to @drink
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @drink.update(drink_params)
      redirect_to @drink
    else
      render 'edit'
    end
  end

  def destroy
    @drink.destroy
    redirect_to root_path
  end

  private

  def find_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:name, :brand, :description, :volume, :caffeine, :calories, :avatar)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
