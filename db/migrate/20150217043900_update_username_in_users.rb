class UpdateUsernameInUsers < ActiveRecord::Migration
    def change
     User.find_each do |user|
		user.username = user.last_name.gsub(/[^0-9a-z]/i, '')+"."+user.first_name.gsub(/[^0-9a-z]/i, '')     
     end
  end
end
