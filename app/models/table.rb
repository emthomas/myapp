class Table < ActiveRecord::Base
  has_many :users
  has_many :pictures
  
  validates :number, presence:true, numericality: { only_integer: true, greater_than: -1, less_than: 20}
  validates :capacity, presence:true, numericality: {only_integer: true, greater_than: 0, less_than: 20}
  
  def is_full?
    self.available_seats > 0
  end
  
  def available_seats
    self.capacity - self.users.size
  end
  
  def add_user(new_user=nil)
    if !new_user.nil?
	   if self.available_seats > 0
         new_user.update_attribute(:table_id,self.id)
	   end
	end
  end
  
  def name(theme = 1)
     pic = Picture.where("pictures.table_id=#{self.id} AND theme=#{theme}").first
	 unless pic.nil?
	    pic.name
     end
  end
  
end

