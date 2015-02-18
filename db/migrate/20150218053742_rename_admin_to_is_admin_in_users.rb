class RenameAdminToIsAdminInUsers < ActiveRecord::Migration
  def change
     rename_column :users, :admin, :is_admin
  end
end
