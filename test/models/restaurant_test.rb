require 'test_helper'

#Minitest is the rails default ? research.
class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @restaurant = FactoryGirl.create(:restaurant)


    @reservation2 = FactoryGirl.create(:reservation)


  end

  # test "Restaurant Exists" do
  #   assert_equal 1, Restaurant.count
  # end

  test "small resetaurant has capacity of 25" do
    assert_equal 25, @restaurant.capacity
  end

  test "reservation when restaurant is under capacity" do
    @reservation1 = FactoryGirl.create(:reservation, restaurant: @restaurant, datetime: Time.now.beginning_of_hour +
        1.day, seats: 10)
    assert_operator @restaurant.capacity, :>, @reservation1.seats
  end

  test "reservation when restaurant is over capacity" do
    assert_not_operator @restaurant.capacity, :>, (@reservation1.seats + @reservation2.seats)
  end


end



