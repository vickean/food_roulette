class Party < ActiveRecord::Base
	belongs_to :restaurant
	has_many :bookings
	has_many :users, through: :bookings
	validates :restaurant_id, uniqueness: true

	# scope :nearby, (location) ->  { joins(:restaurants).where('restaurants.location = ?', location)}
	scope :affordable, -> (spin) { joins(:restaurant).where('restaurants.price_tier < ?', spin)}
	scope :suitable_date, -> (date) { where('datetime::date = ?', date)}
	scope :num_of_pax, -> (party_id) { joins(:bookings).where('party_id =?', party_id )}

	def self.select_random_party(lat, long, spin, date)
		nearby_restaurants = Restaurant.near([lat, long], 1, order: false).pluck(:id)
		result_parties = affordable(spin).suitable_date(date).where(restaurant_id: nearby_restaurants)
		available_parties = []
		result_parties.each do |party|
			available_parties << party if party.not_full?
		end
		return available_parties.sample
	end

	# check if the user_id passed already exists in the party
	def double_booked?(user)
		self.users.include? user
	end

	def not_full?
		self.number_of_people < self.restaurant.no_of_guests
	end
end
