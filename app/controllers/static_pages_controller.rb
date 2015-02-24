class StaticPagesController < ApplicationController
  include StaticPagesHelper
 
  before_action :logged_in_user, only: [:wedding]
  
  def home
  end

  def about
  end
  
  def wedding
     
  	if params[:commit] == get_rsvp(0)
  	 	current_user.update_attribute(:is_coming, true)
  	elsif params[:commit] == get_rsvp(1)
  	 	current_user.update_attribute(:is_coming, false)
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
