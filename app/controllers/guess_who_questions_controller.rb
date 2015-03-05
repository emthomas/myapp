class GuessWhoQuestionsController < ApplicationController
  def new
  		@guess_who_question = GuessWhoQuestion.new(:question => params[:question], :answer => params[:answer])
  		if @guess_who_question.save
  			flash[:success] = "New Question Added"
  		else
  			flash[:danger] = "There was an error"
  		end
      redirect_to guess_who_questions_path
  end
  
  def index
       #@guess_who_questions = GuessWhoQuestion.all.paginate(page: params[:page])
       @guess_who_questions = GuessWhoQuestion.joins("LEFT OUTER JOIN guess_who_user_answers on guess_who_user_answers.guess_who_question_id = guess_who_questions.id and guess_who_user_answers.user_id="+current_user.id.to_s)
       										  .select("guess_who_questions.id, guess_who_questions.question, guess_who_questions.answer, guess_who_user_answers.id AS answer_id, guess_who_user_answers.answer AS user_answer")
       										  .paginate(page: params[:page])
  end
  
  def create
    #if params[:commit]
  	#  current_user.update_attribute(:is_coming, get_rsvp(params[:commit]))
  	#end
    guess_who_questions_path
  end 
  
  def save_user_answer
    @user_answer = GuessWhoUserAnswer.find_by(user_id: current_user.id, guess_who_question_id: params[:id])
  	if @user_answer
  		@user_answer.update_attributes(:guess_who_question_id => params[:id], :user_id => current_user.id, :answer => params[:answer])
  	else
  		@user_answer = GuessWhoUserAnswer.new(:guess_who_question_id => params[:id], :user_id => current_user.id, :answer => params[:answer])
  		@user_answer.save
  	end
  	redirect_to guess_who_questions_path
  end
  
  def edit
    GuessWhoQuestion.find(params[:id]).update_attributes(:question => params[:question], :answer => params[:answer])
  	redirect_to guess_who_questions_path
  end
  
  def destroy
    GuessWhoQuestion.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to guess_who_questions_path
  end
end
