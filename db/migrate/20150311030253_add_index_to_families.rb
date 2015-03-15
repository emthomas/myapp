class AddIndexToFamilies < ActiveRecord::Migration
  def change
     add_index :families, :name, :unique => true
  end
end
