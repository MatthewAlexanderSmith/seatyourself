class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  
  # before_action :available?

  # def available?(party_size)
  #
  # end


end
