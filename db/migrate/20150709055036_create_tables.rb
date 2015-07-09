class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number, null: false, default: -1

      t.timestamps null: false
    end
    add_index :tables, :number, unique: true
  end
end
