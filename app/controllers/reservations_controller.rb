class ReservationsController < ApplicationController
  before_action :load_restaurant
  before_action :current_user

  def new
  end

  def create
    @reservation = @restaurant.reservations.create(reservation_params)
    @reservation.user_id = @current_user[:id]

    available?(@reservation.seats)

    if @reservation.save
      redirect_to user_url(@current_user), notice: "Reservation Successful!"
    else
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

  def available?(seats)
    #same as self.reservations
    #sum up the party sizing column and give it back to me.

    @restaurant.reservations.each do |reservation|
      if reservation.reservation_time == @reservation.reservation_time

        seats += reservation.seats

        available_capacity = @restaurant.capacity - seats

        if available_capacity <= 0
          puts "We are full at that time!!"
          return false
        elsif available_capacity >=0
          puts "Lot's of space!!"
          return true
        end
        
      end
    end

    # available_capacity = @restaurant.capacity - @restaurant.reservations.sum(:seats)
    # puts @restaurant.capacity
    # puts @restaurant.reservations.sum(:seats)
    # puts available_capacity
    # puts "________________________________"
  end

end
