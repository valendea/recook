class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_secure_password

	validates_presence_of :first_name, :last_name, :password, :email

  validates :password, length: { minimum: 7 }
  validates :email, uniqueness: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i), message: "has registered before"}

	has_many :authentications, dependent: :destroy
	has_many :recipes, dependent: :destroy
	has_many :votes, dependent: :destroy

	# attr_accessible :avatar
	# mount_uploader :avatar, AvatarUploader

	def self.create_with_auth_and_hash(authentication, auth_hash)
    # byebug
    user = self.create!(
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      email: auth_hash["info"]["email"],
      # photo: auth_hash["info"]["image"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end
end
