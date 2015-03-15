class ChangeNameToFamilyNameInFamilies < ActiveRecord::Migration
  def change
     rename_column :families, :name, :family_name
  end
end
