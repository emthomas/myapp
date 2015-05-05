class AddNamesToMessages < ActiveRecord::Migration
  def change
     add_column :messages, :first_name, :string
     add_column :messages, :last_name, :string
  end
end
