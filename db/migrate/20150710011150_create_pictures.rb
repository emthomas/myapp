class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :table, index: true
      t.integer :theme, default: 0
      t.string :url
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :pictures, :tables
  end
end
