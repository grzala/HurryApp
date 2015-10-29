class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private  
  def mobile?  
    request.user_agent =~ /Mobile|webOS/  
  end 

  private
  def user_exist?
    unless User.where(["name = :name and id = :id", { name: session[:user_name], id: session[:user_id] }]).blank?
      true
    else
      false
    end
  end    

  helper_method :user_exist?
  helper_method :mobile?
 
end

# author Marcel Zak
