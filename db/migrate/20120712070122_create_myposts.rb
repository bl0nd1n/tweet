class CreateMyposts < ActiveRecord::Migration
  def change
    create_table :myposts do |t|
      t.string :content
      t.integer :user_id
      t.string :image_url

      t.timestamps
    end
	add_index :myposts, [:user_id, :created_at]
  end
end
