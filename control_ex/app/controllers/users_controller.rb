class UsersController < ApplicationController
  # GET /posts and /posts.json
  def index
  	@users = User.all

  	respond_to do |format|
  		format.html #index.html.erb
  		format.json {render json: @users}
  	end	
  end

  def new
  end

  def create
  	render :text => params
  end
end
