class AddLoginCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :logins, :int, :default => 0
  end
end
