class AddTableRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :table, index: true
    add_foreign_key :users, :tables
  end
end
