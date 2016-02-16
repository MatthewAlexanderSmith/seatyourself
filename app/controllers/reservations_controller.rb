class ReservationsController < ApplicationController
  before_action :load_restaurant
  before_action :current_user

  def new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = @current_user[:id]

    if @reservation.save
      redirect_to user_url(@current_user), notice: "Reservation Successful!"
    else
      puts @reservation.errors.full_messages
      render 'restaurants/show'
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
    params.require(:reservation).permit(:reservation_time, :seats, :user_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end



    # available_capacity = @restaurant.capacity - @restaurant.reservations.sum(:seats)
    # puts @restaurant.capacity
    # puts @restaurant.reservations.sum(:seats)
    # puts available_capacity
    # puts "________________________________"


end
