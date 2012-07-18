class AddImageToPinposts < ActiveRecord::Migration
  def change
    add_column :pinposts, :image, :string
  end
end
