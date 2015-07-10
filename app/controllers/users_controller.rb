class UsersController < ApplicationController
  require 'will_paginate/array'

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,	 only: [:index, :destroy, :show]
  
  skip_before_action :log_user_out, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    if params[:commit]
    	@user = User.create(first_name: params[:first_name], 
							last_name: params[:last_name],
							password: "password", 
							password_confirmation: "password")
							
    	if @user.save
  			flash[:success] = @user.first_name+" was Added"
  		else
  			flash[:danger] = "There was an error"
  		end
  		
  		redirect_to users_path
    else
    	@user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      if !@user.email.nil?
         @user.send_activation_email
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
    @user.activate
    redirect_to :back
  end
  
  # Activate a user in the database
  def deactivate
    @user = User.find(params[:id])
    @user.deactivate
    redirect_to :back
  end
  
  # Activate a user in the database
  def set_is_adult
    @user = User.find(params[:id])
    @user.set_is_adult
    redirect_to :back
  end

  def untable
    @user = User.find(params[:id])
    @user.untable
    redirect_to :back
  end
  
  # Activate a user in the database
  def set_is_not_adult
    @user = User.find(params[:id])
    @user.set_is_not_adult
    redirect_to :back
  end
  
  def invite
  	@user = User.find(params[:id])
    @user.update_attribute(:invited, true)
    redirect_to :back
  end
  
  def uninvite
  	@user = User.find(params[:id])
    @user.update_attribute(:invited, false)
    redirect_to :back
  end
  
  def iscoming
  	@user = User.find(params[:id])
    @user.update_attribute(:is_coming, true)
    flash[:success] = params
    redirect_to :back
  end
  
  def isnotcoming
  	@user = User.find(params[:id])
    @user.update_attribute(:is_coming, false)
    redirect_to :back
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to :back
  end
  
  def update
  	flash[:danger] = "Please change your password."
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      if logged_in_admin?
      	 flash[:success] = "#{@user.first_name}'s profile updated"
      	 redirect_to users_path
      else
    	 if @user.has_default_pass?
    	 	flash.now[:danger] = 'Please change your password!'
    	 	render 'edit'
    	 else
    	 	@user.activate
            redirect_to @user
         end
      end 
    else
      render 'edit'
    end
  end
  
  def index
       @users = User.joins(:family)
       		    .where(params[:address_param])
                    .where(params[:email_param])
                    .where(params[:admin_param])
                    .where(params[:invited_param])
                    .where(params[:activated_param])
                    .where(params[:is_coming_param])
                    .where(params[:is_adult_param])
                    .where("LOWER(first_name) LIKE '%#{params[:name_filter_param]}%' OR LOWER(last_name) LIKE '%#{params[:name_filter_param]}%'")
                    .order(:last_name)
					
		 unless params[:seated_param].blank?
		   if params[:seated_param] == 'true'
              @users = @users.joins(:table)			  
           elsif params[:seated_param] == 'false'
			  @seated_users = User.joins(:table)
			  @users = @users - @seated_users
           end		   
		 end
	    
       @users = @users.paginate(page: params[:page], per_page: 25)
       @available_tables = Table.joins("LEFT OUTER JOIN users on users.table_id = tables.id").group(:number).having("count(*)<max(capacity)")
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

end
