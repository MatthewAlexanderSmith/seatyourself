require 'test_helper'

#Minitest is the rails default ? research.
class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @small = FactoryGirl.create(:small_restaurant)
    @large = FactoryGirl.create(:large_restaurant)
  end

  # test "Restaurant Exists" do
  #   assert_equal 1, Restaurant.count
  # end

  test "large resetaurant has capacity of 100" do
    assert_equal 100, restaurants(:large_restaurant).capacity
  end

  test "small resetaurant has capacity of 25" do
    assert_equal 100, restaurants(:small_restaurant).capacity
  end
  
end
