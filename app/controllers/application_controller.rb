class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :log_user_out
  
  def log_user_out
  	if logged_in? && current_user.has_default_pass?
  	   log_out
  	end
  end

   # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless ( current_user?(@user) || (logged_in? && current_user.admin?))
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless (logged_in? && current_user.admin?)
    end
	
end
