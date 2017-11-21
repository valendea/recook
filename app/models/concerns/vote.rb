class Vote < ApplicationRecord

	# validates :user_id, uniqueness: true

	validates :recipe_id, uniqueness: { scope: [:user_id] }


	belongs_to :user
	belongs_to :recipe

end