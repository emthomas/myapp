class CreateSongRequests < ActiveRecord::Migration
  def change
    create_table :song_requests do |t|
      t.string :name
      t.string :author
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :song_requests, :users
  end
end
