class ItemsController < ApplicationController
  def index
  end

  def new
    @users = User.new
  end

  def create
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
     redirect_to root_path
  end
  
end
