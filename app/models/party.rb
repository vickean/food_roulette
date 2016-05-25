class Party < ActiveRecord::Base
	belongs_to :restaurant
	has_many :bookings
	has_many :users, through: :bookings
end