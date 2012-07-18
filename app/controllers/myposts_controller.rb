class MypostsController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
  # GET /myposts
  # GET /myposts.json
  def index
    @myposts = Mypost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @myposts }
    end
  end

  # GET /myposts/1
  # GET /myposts/1.json
  def show
    @mypost = Mypost.find(params[:id])
    @feed_me_items = []
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mypost }
    end
  end

  # GET /myposts/new
  # GET /myposts/new.json
  def new
    @mypost = Mypost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mypost }
    end
  end

  # GET /myposts/1/edit
  def edit
    @mypost = Mypost.find(params[:id])
  end

  # POST /myposts
  # POST /myposts.json
  def create
    #@mypost = Mypost.new(params[:mypost])
    @mypost = current_user.myposts.build(params[:mypost])
    respond_to do |format|
      if @mypost.save
        format.html { redirect_to @mypost, notice: 'Mypost was successfully created.' }
        format.json { render json: @mypost, status: :created, location: @mypost }
		flash[:success] = "Mypost created!"
      else
        format.html { render action: "new" }
        format.json { render json: @mypost.errors, status: :unprocessable_entity }
		@feed_items = []
		render 'static_pages/home'
      end
    end
  end

  # PUT /myposts/1
  # PUT /myposts/1.json
  def update
    @mypost = Mypost.find(params[:id])

    respond_to do |format|
      if @mypost.update_attributes(params[:mypost])
        format.html { redirect_to @mypost, notice: 'Mypost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mypost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myposts/1
  # DELETE /myposts/1.json
  def destroy
    @mypost = Mypost.find(params[:id])
    @mypost.destroy
	redirect_to root_path

    respond_to do |format|
      format.html { redirect_to myposts_url }
      format.json { head :no_content }
    end
		 end
		 
		 private

    def correct_user
      @mypost = current_user.myposts.find_by_id(params[:id])
      redirect_to root_path if @mypost.nil?
		 
  end
  
  
  def feed_my
Mypost.where(id)
  end
  
end
