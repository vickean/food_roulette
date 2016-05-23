<<<<<<< HEAD
class User<ActiveRecord::Base
=======
class User <ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader
>>>>>>> c6fafbbf2ff491350125b373c8b159c849d57b75
  include Clearance::User

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

end
