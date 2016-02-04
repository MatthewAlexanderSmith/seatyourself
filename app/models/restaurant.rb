class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations



  def available?(party_size)

    #same as self.reservations
    #sum up the party sizing column and give it back to me.
    reservations.sum(:party_size)
    available_capacity = capacity - reservations.sum(:party_size)
  end

end
