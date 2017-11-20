class RecipesController < ApplicationController
	before_action :set_recipe, only: [:show, :edit, :update, :destroy]


	def index
		@recipes = Recipe.all
		# @recipes = current_user.recipes
	end

	def create
		@recipe = current_user.recipes.new(recipe_params)
		if @recipe.save
			redirect_to recipes_path, notice: "Recipe has succesfully created"
		else
			render :new
		end
	end

	def new
		@recipe = Recipe.new
	end

	def show
    # @recipes = current_user.recipes
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
