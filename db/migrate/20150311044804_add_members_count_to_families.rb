class AddMembersCountToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :member_count, :int
  end
end
