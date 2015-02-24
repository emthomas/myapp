class AddReplyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_coming, :boolean, :default => false
  end
end
