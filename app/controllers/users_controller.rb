class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,	 only: [:index, :destroy, :edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      if @user.email
         UserMailer.account_activation(@user).deliver_now
       end
       
      if logged_in_admin?
        flash[:success] = "Account Created"
    	redirect_to users_path
      else 
        flash[:info] = "Please check your email to activate your account."
      	redirect_to root_url
      end

    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  # Activate a user in the database
  def activate
    @user = User.find(params[:id])
    @user.update_attribute(:activation_digest, User.digest(User.new_token))
    @user.update_attribute(:activated, true)
    redirect_to users_url
  end
  
  # Activate a user in the database
  def deactivate
    @user = User.find(params[:id])
    @user.update_attribute(:activated, false)
    @user.update_attribute(:activation_digest, nil)
    redirect_to users_url
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      if logged_in_admin?
      	 redirect_to users_path
      else
         redirect_to @user
      end 
    else
      render 'edit'
    end
  end
  
  def index
       @users = User.where(params[:address_param])
                    .where(params[:email_param])
                    .where(params[:admin_param])
                    .where(params[:invited_param])
                    .where(params[:is_coming_param])
                    .order(:last_name)
                    .paginate(page: params[:page])
  end
  
  private

    def user_params
     # params.require(:user).permit(:first_name, 
     # 								:last_name, 
     # 								:email,
     # 								:address, 
     # 								:admin, 
     # 								:invited, 
     # 								:is_coming,
     # 								:password,
     # 								:password_confirmation)
     params.require(:user).permit!
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
