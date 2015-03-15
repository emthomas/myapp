class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, unique: true, using: :btree 

      t.timestamps null: false
    end
  end
end
