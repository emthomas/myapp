class AddIsAdultToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_adult, :boolean, :default => true
  end
end
