class ItemsController < ApplicationController
  def index
  end

  def new
    @users = User.new
  end

  def create
  end
  
end
