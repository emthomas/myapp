class Family < ActiveRecord::Base
#attr_accessor :family_name

validates :family_name, presence: true, length: { maximum: 20 }

before_save do 
	self.family_name = family_name.gsub(/[^0-9a-z]/i, '').downcase
  end

end
