class SessionsController < ApplicationController
  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = user_path(user)
      @notice = "Signed in!"
      # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = edit_user_path(user)
      @notice = "User created. Please confirm or edit details"
    end


    session[:user_id] = user.id
    redirect_to @next, :notice => @notice
  end

  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to recipes_path, notice: 'Logged in'
  	else
  		flash.now.alert = 'Email or password is invalid'
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: 'Succesfully logged out'
  end
end
