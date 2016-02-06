class RestaurantsController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :current_user
  before_action :load_restaurant, only: [:show, :destroy, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = @current_user.owned_restaurants.create(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_url(@restaurant), Notice: "Restaurant Created Successfully!"
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
  end

  def destroy
  end

  def edit
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description, :picture_url, :capacity, :email)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
