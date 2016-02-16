class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations

  # before_action :available?

  # def available?(party_size)
  #
  # end


  def available?(seats, date_time)
    bookedSeats = 0;
    puts "This is the capacity of #{self.name}: #{self.capacity}"
    puts "This is how many reservations have been made here: #{self.reservations.length}"
    puts "This is how many seats were requested for your reservation: #{seats}"
    count = 0;
    self.reservations.each do |reservation|
      if reservation.id && (reservation.reservation_time == date_time)
        bookedSeats += reservation.seats
        count += 1;
      end
    end

    puts "This is how many seats were already booked at the time you requested: #{bookedSeats}"

    available_capacity = self.capacity - bookedSeats

    puts "This is the available_capacity not including your requested amount of seats: #{available_capacity}"

    if available_capacity < seats
      puts "We are full at that time!!"
      errors.add(:base, "We're sorry, there are no available seats at that time.")
      return false

    elsif available_capacity >= seats
      puts "Lot's of space!!"
      return true
    end
  end

end
