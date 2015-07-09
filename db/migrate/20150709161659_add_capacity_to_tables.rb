class AddCapacityToTables < ActiveRecord::Migration
  def change
    add_column :tables, :capacity, :integer, default: 15
  end
end
