class Message < ActiveRecord::Base

	before_save do 
		#self.user_id = @current_user.id
		self.new_message = true unless !self.new_message.nil?
  	end
  	
  	validates :subject, presence: true
  	validates :body, presence: true
  	validates :first_name, presence: true
  	validates :last_name, presence: true
  
end
