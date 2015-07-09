class GuessWhoQuestion < ActiveRecord::Base

validates :question, presence: true


def get_total_answered
  GuessWhoUserAnswer.where(:guess_who_question_id => self.id).count
end

def get_right_answered
  GuessWhoUserAnswer.where(:guess_who_question_id => self.id)
                    .where(:answer => self.answer)
                    .joins("JOIN users ON users.id = guess_who_user_answers.user_id")
                    .select("users.first_name")
                    .map{|result| result.first_name}
end

end
