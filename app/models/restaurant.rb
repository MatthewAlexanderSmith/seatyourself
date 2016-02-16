class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations


  # before_action :available?

  # def available?(party_size)
  #
  # end


  def available?(seats, date_time)
    bookedSeats = self.reservations.where(reservation_time: date_time).sum(:seats)
    available_capacity = self.capacity - bookedSeats
    return available_capacity >= seats
  end

end
