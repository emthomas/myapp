class Picture < ActiveRecord::Base
  belongs_to :table
  
  validates_uniqueness_of :url
end