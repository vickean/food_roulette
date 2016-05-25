class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :parties
	validates :name, presence: true
	validates :description, presence: true
	validates :no_of_guests, presence: true
	validates :price_per_person, presence: true
	validates :address, presence: true
	validates :contact_number, presence: true
	validates :price_tier, presence: true
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
