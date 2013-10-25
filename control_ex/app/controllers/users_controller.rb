class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	render :text => params
  end
end
