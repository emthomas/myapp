class AddFamilyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :family_id, :integer
    add_index :users, :family_id
    add_foreign_key :users, :families
  end
end
