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

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end
