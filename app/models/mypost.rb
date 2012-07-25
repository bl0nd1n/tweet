class Mypost < ActiveRecord::Base
  attr_accessible :content, :image_url
  belongs_to :user
  has_many :comments, :as => :commentable
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  default_scope order: 'myposts.created_at DESC'
     
	 
	 
	 
 def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
def self.from_users(user)
    followed_user_ids = "SELECT user_id FROM microposts
                         WHERE user_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
end
