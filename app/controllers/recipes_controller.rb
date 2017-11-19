class RecipesController < ApplicationController

	def index
	end

	def new
		@recipe = Recipe.new
	end

	def edit
	end

	private
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def allowed_params
		params.require(:recipe).permit(:title, :description, :ingredients, :steps, photos: [])
	end

end
