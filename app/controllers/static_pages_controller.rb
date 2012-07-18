class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
	  @feed_me_items = current_user.feed_me.paginate(page: params[:page])
	  @mypost = current_user.myposts.build if signed_in?
    end
  end
  
  def help
  end

  def pins
  if signed_in?
  @pinpost  = current_user.pinposts.build if signed_in?
  @feed_pin_items = current_user.feed_pin.paginate(page: params[:page])
  end
  end
  
    def myposts
  if signed_in?
  @mypost  = current_user.myposts.build if signed_in?
	  @feed_me_items = current_user.feed_me.paginate(page: params[:page])
  end
  end
  
  def show
  if signed_in?
  @mypost = current_user.myposts.build if signed_in?
  @pinpost  = current_user.pinposts.build if signed_in?
  @feed_pin_items = current_user.feed_pin.paginate(page: params[:page])
  end
  end
	
  def upload
  @pinpost  = current_user.pinposts.build if signed_in?
  end	
  
  def post
  @pinpost  = current_user.pinposts.build if signed_in?
  end
	
  def about
  end

  def contact
  end
end
