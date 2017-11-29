class Recipe < ApplicationRecord
	belongs_to :user
	
	validates_presence_of :title, :ingredients, :steps

	serialize :photos, Array
	mount_uploaders :photos, PhotoUploader

	# has_many :recipes, dependent: :destroy

	paginates_per 5

	def self.search(search)
    result = []
    result << where("title ILIKE ?", "%#{search}%")
    result << where("description ILIKE ?", "%#{search}%") 
    result << where("ingredients ILIKE ?", "%#{search}%")
    
    i = 0
    while i < 3
      return result[i] if result[i].length > 0 
      i += 1
    end
  end
end


# => ["id", "user_id", "title", "description", "ingredients", "steps", "photos", "created_at", "updated_at"]