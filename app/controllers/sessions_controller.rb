class SessionsController < ApplicationController
  def new
  end

  def create
	if user = User.authentication(params[:name], params[:password])
		session[:user_id] = user.id
		redirect_to toilets_url
	else
		redirect_to login_url, :alert => "Username or password is invalid"
	end
  end

  def destroy
	session[:user_id] = nil
  end
end
