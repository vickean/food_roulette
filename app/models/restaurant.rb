class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :no_of_guests, presence: true
	validates :price_per_person, presence: true
	validates :address, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :contact_number, presence: true
	validates :price_tier, presence: true
end
