February 15th, 2016:

the available? method in the reservation controller works.

Now I need to add validations to the Restaurants and/or the reservations model
* preventing a reservation from being saved if the available capacity is exceeded.

validate :available?
____
