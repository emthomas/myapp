class MessagesController < ApplicationController

	def new
		@message = Message.new
	end
	
	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def update
	end
	
	def index
		@messages = Message.all.order("#{:created_at} DESC").paginate(page: params[:page])
	end
	
	 def mark_as_read
		@message = Message.find(params[:id])
		@message.update_attribute(:new_message, false)
		flash[:success] = @message.new_message
		redirect_to :back
	  end
  
	  def mark_as_unread
		@message = Message.find(params[:id])
		@message.update_attribute(:new_message, true)
		redirect_to :back
	  end
	
	def destroy
    	Message.find(params[:id]).destroy
    	flash[:success] = "Message deleted"
    	redirect_to :back
    end
	
	private
	def message_params
		params.require(:message).permit(:subject, :body, :last_name, :first_name, :new_message)
	end
end
