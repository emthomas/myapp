class CreateGuessWhoQuestions < ActiveRecord::Migration
  def change
    create_table :guess_who_questions do |t|
      t.string :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
