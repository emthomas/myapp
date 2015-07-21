class SongRequest < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true
end
