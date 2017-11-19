class Recipe < ApplicationRecord
	belongs_to :user
	
	validates_presence_of :title, :ingredients, :steps

end


# => ["id", "user_id", "title", "description", "ingredients", "steps", "photos", "created_at", "updated_at"]
