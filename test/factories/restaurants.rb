FactoryGirl.define do
  factory :small_restaurant, class: Restaurant do
    # When you put code in a block it runs everytime you create a new object
    capacity { rand (25)}
  end

  factory :large_restaurant, class: Restaurant do
    capacity { rand(100)}
  end
end
