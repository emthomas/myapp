class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :user_id
      t.boolean :new_message

      t.timestamps null: false
    end

    add_index :messages, :new_message
    add_index :messages, :user_id
    add_foreign_key :messages, :users
  end
end
