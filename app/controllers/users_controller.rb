class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(allowed_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render :new
		end
	end

	def index
	end

	def edit
	end

	def update
    # respond_to do |format|
      if @user.update(allowed_params)
      	redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    # end
  end

	private
	def allowed_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def set_user
  	@user = User.find(params[:id])
  end
end
