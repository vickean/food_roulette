class User <ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  has_many :restaurants
  has_many :bookings
  has_many :parties, through: :bookings
  mount_uploader :avatar, AvatarUploader
  before_save :default_values

  include Clearance::User
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      #u.first_name = auth_hash["info"]["first_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.encrypted_password = [*('A'..'Z')].sample(8).join
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  def restaurant_owner?
    user_type == 1
  end

  def admin?
    user_type == 2
  end

  def default_values
    self.spin_num ||= 0
  end

end
