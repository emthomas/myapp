class Table < ActiveRecord::Base
  has_many :users
  
  validates :number, presence:true, numericality: { only_integer: true, greater_than: -1, less_than: 20}
  validates :capacity, presence:true, numericality: {only_integer: true, greater_than: 0, less_than: 20}
end
