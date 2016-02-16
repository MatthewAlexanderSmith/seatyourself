class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validate :available?


  def available?
    unless restaurant.available?(self.seats, self.reservation_time)
      errors.add(:base, "We're sorry, there are no available seats at that time.")
    end
  end

end
