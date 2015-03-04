class StaticPagesController < ApplicationController
  include StaticPagesHelper
 
  before_action :logged_in_user, only: [:wedding]
  
  def home
  end

  def about
  end
  
  def wedding
    if params[:commit]
  	  current_user.update_attribute(:is_coming, get_rsvp(params[:commit]))
  	end
    wedding_path
  end 
  
  private

    def user_params
      params.require(:user).permit(:first_name, 
      								:last_name, 
      								:email,
      								:address, 
      								:admin, 
      								:invited, 
      								:is_coming,
      								:password,
      								:password_confirmation)
    end
    
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end 
end
