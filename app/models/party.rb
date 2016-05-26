class Party < ActiveRecord::Base
	belongs_to :restaurant
	has_many :bookings
	has_many :users, through: :bookings
	validates :restaurant_id, uniqueness: true

	# scope :nearby, (location) ->  { joins(:restaurants).where('restaurants.location = ?', location)}
	scope :affordable, -> (spin) { joins(:restaurant).where('restaurants.price_tier < ?', spin)}
	scope :suitable_date, -> (date) { where('datetime::date = ?', date)}
	scope :num_of_pax, -> (party_id) { joins(:booking).where('party_id =?', party_id )}
	# scope :full_party -> () { where('number_of_people = ?', }

	def self.check_party(lat, long, spin, date)
		nearby_restaurants = Restaurant.near([lat, long], 1, order: false).pluck(:id)
		result_restaurants = affordable(spin).suitable_date(date).where(restaurant_id: nearby_restaurants)
		another_array = []
		result_restaurants.each do |x|
			a = Party.find_by(restaurant_id: x)
			another_array << a
		end
		final_array = []
		another_array.each do |y|
			if num_of_pax(y.id).count < y.number_of_people
				final_array << y
			end
		end
		if final_array != []
			return final_array[0]
		else
			return nil
		end
	end
end