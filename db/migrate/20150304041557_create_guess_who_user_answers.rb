class CreateGuessWhoUserAnswers < ActiveRecord::Migration
  def change
    create_table :guess_who_user_answers do |t|
      t.integer :guess_who_question_id
      t.integer :user_id
      t.string :answer

      t.timestamps null: false
    end

    add_index :guess_who_user_answers, :user_id
    add_foreign_key :guess_who_user_answers, :users
    add_foreign_key :guess_who_user_answers, :guess_who_questions
  end
end
