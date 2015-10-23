class SessionsController < ApplicationController
  def new
  end

  def create
	if @current_user = User.authenticate(params[:name], params[:password])
		session[:user_id] = @current_user.id
		session[:user_name] = @current_user.name
		redirect_to root_path
	else
		redirect_to login_url, :alert => "Username or password is invalid"
	end
  end

  def destroy
	session[:user_id] = nil
	@current_user = nil
    redirect_to root_url
  end
end
