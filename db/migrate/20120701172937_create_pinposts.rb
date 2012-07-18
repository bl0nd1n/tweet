class CreatePinposts < ActiveRecord::Migration
  def change
    create_table :pinposts do |t|
      t.string :url_image
      t.string :title
      t.integer :user_id

      t.timestamps
    end
	add_index :pinposts, [:user_id, :created_at]
  end
end
