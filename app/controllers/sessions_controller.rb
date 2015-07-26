class SessionsController < ApplicationController
  skip_before_action :log_user_out, only: [:create]

  def new
  end

	def create
		user = User.find_by(username: params[:session][:username].downcase)
		if user 
			if user.activated? && user.authenticate(params[:session][:password])
				log_in user
				params[:session][:remember_me] == '1' ? remember(user) : forget(user)
				
				if get_days_left < 5 && !logged_in_admin?
				   flash[:danger] = "Woops! Thanks for everything! we are already enjoying our honeymoon or about to! Leave us a message if you want!"
				   destroy
				else
				 redirect_back_or root_url
				end
			else
				if user.activated?
					flash[:danger] = "Invalid username/password combination"
					render 'new'
				else
					message  = "Account not activated. "
					message += "Please contact us to activate your account."
					#flash[:warning] = message
					log_in user
					redirect_back_or edit_user_path(current_user)
				end
			end
		else 
                      flash[:danger] = "Invalid username"
                      redirect_back_or login_url
                end
	end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
