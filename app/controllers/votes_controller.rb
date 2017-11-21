class VotesController < ApplicationController
	# before_action :set_user_recipe

	def create
		vote = Vote.new
		# params = { value: value, recipeId: rId }
		value = params[:value].to_i
		if value == 1
			vote.value = 1
		else
			vote.value = 0
		end
		vote.user_id =  current_user.id
		vote.recipe_id = params[:recipeId]
		vote.save
		# response = Vote.where(value: params[:value] and recipe_id: params[:recipeId]).count

		# User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
		response = Vote.where(["value = ? and recipe_id = ?", value, vote.recipe_id]).count

		# response = Vote.where({ value: a, recipe_id: vote.recipe_id })

		respond_to do |format|
			format.js { render json: response.to_json }
		end
		
		# respond_to do |format|
		# 	format.js 
		# end
	end

	# def set_user_recipe
 #  	@recipe = Recipe.find(params[:id])
 #  end

end
