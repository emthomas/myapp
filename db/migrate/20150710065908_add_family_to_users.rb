class AddFamilyToUsers < ActiveRecord::Migration
  def change
    add_foreign_key :users, :families
  end
end
