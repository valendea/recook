class RecipesController < ApplicationController
	before_action :set_recipe, only: [:show, :edit, :update, :destroy]


	def index
		# @recipes = Recipe.all
		if params[:search]
      @recipes = Recipe.search(params[:search])
      if @recipes.nil?
        flash[:notice] = "There are no posts containing the terms \"#{params[:search]}\""
        redirect_to recipes_path
      else
       @recipes = @recipes.order("created_at DESC").page params[:page]
     end
    else
      @recipes = Recipe.order(:title).page params[:page]
    end
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
# 	auth ={
# 		cloud_name: ENV['cloud_name'], 
# 		api_key: ENV['api_key'],
# 		api_secret: ENV['api_secret']
# 	}


# Cloudinary::Uploader.upload(params[image, auth)


		if @recipe.update(recipe_params)

			redirect_to @recipe, notice: 'Recipe was succesfully updated'
		else
			render :edit
		end
	end

	def vote
		# yes = 0
		# no = 0
		# if params[:qwe] =+ 1
	end

	private
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :ingredients, :steps, photos: [])
	end

end
