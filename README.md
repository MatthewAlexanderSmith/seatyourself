February 15th, 2016:

the available? method in the reservation controller works.

Now I need to add validations to the Restaurants and/or the reservations model
* preventing a reservation from being saved if the available capacity is exceeded.

validate :available?
____

February 16th, 2016:

* Added available? method to restaurant model
* changed
  @reservation = @restaurant.reservations.create(reservation_params)

  to

  @reservation = @restaurant.reservations.build(reservation_params)
* adjusted reservations#create so @restaurant.available? must return true before attempting to save a new reservation to the database.


In order to find out if a restaurant has reached capacity:
* iterate through all reservations that have been made for a given restaurant
* Add seats together, for all existing reservations,that have a reservation_time equal to the reservation_time of the new reservation request.

Q: Why is an unsaved reservation showing up in the self.reservations list in the available? method? In the restaurant model?

I noticed that, when iterating over this list (self.reservations) in the restaurant model, the new reservation request was included in the list. Even though it had not yet been saved to the database.

To solve the problem I added 'reservation.id' to the if statement shown below(see full context in restaurant model).

Only when a reservation has actually been saved to the database, will it be given an id.

self.reservations.each do |reservation|
  if reservation.id && (reservation.reservation_time == date_time)
    bookedSeats += reservation.seats
    count += 1;
  end
end
______
February 17th, 2015

# Restaurant Model
  self.reservations.each
  * iterates through all reservations in memory - which includes the new reservation that has not yet been saved.

bookedSeats = self.reservations.where(reservation_time: date_time).sum(:seats)
  * executes a database query which will only look at reservations that have already been saved to the database.
  * finds all the reservations that match date_time
  * returns the sum of all the seats

return available_capacity >= seats
  * returns true if expression is true, and false otherwise
  * replaces the full on if else statement.

# Reservation Model
* added validation
  validate :check_availability
* the check_availability method calls the available? method in the restaurant model
* adds custom error message

# Reservations Controller

## reservations#create

@reservation.save
* runs validations in the reservation model
* calls the check_availability method
