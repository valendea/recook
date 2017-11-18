class User < ApplicationRecord
	has_secure_password

	# validate_uniqueness_of :email
end
