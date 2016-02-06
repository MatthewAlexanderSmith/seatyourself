class ReservationsController < ApplicationController
  before_action load_restaurant

  def new
  end

  def create
    @reservation = @restaurant.reservations.create(reservation_params)
    @reservation.user_id = current_user

    if @reservation.save
      redirect_to user_url

    end
  end

  def destroy
  end

  def show
  end

  def edit
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation_time, :seats)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

  end


end
