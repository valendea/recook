class RecipesController < ApplicationController

	def index
	end

	def new
		@recipe = Recipe.new
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe, notice: 'Recipe was succesfully updated'
		else
			render :edit
		end
	end

	private
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :ingredients, :steps, photos: [])
	end

end
