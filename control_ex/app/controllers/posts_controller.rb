class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	render :text => params #like var_dump in php
  end
end
