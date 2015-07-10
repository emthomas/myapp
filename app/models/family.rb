class Family < ActiveRecord::Base
  has_many :users

#attr_accessor :family_name

validates :family_name, presence: true, length: { maximum: 20 }

before_save do 
	self.family_name = family_name.gsub(/[^0-9a-z]/i, '').downcase
  end

def coming
  self.users.where(is_coming: 1)
end

def seated
  self.coming.joins(:table)
end

def not_seated
   self.coming - self.seated
end
end
