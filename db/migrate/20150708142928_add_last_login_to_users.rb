class AddLastLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_login, :date
  end
end
