class GuessWhoQuestion < ActiveRecord::Base

validates :question, presence: true

end
