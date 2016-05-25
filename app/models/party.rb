class Party < ActiveRecord::Base
	belongs_to :restaurant
	has_many :bookings
	has_many :users, through: :bookings

	# scope :nearby, (location) ->  { joins(:restaurants).where('restaurants.location = ?', location)}
	scope :affordable, (spin) -> { joins(:restaurants).where('restaurants.price_tier = ?', spin)}
	scope :suitable_date, (date) -> { where('datetime = ?', date)}

	def self.check_party(lat, long, spin, date)
		nearby_restaurants = Restaurant.near([lat, long], 1).pluck(:id)
		self.affordable(spin).suitable_date(date).where(restaurant_id: nearby_restaurants)
	end
end