class PinpostsController < ApplicationController
  before_filter :signed_in_user
  
def create
    @pinpost = current_user.pinposts.build(params[:pinpost])
    if @pinpost.save
      flash[:success] = "Pinpost created!"
      redirect_to root_path
    else
	@feed_pin_items = []
      render 'static_pages/post'
    end
  end
  
  def show
    @pinposts = Pinposts.find(params[:id])
	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pinposts }
	  end
  end
   
   def correct_user
      @pinpost = current_user.pinposts.find_by_id(params[:id])
      redirect_to root_path if @pinpost.nil?
    end
   
def destroy
    @micropost.destroy
	@pinpost.destroy
    redirect_to root_path
  end
end