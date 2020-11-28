class PurchasesController < ApplicationController
  before_action :set_item

  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
       @item_purchase.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private

 def purchase_params
  params.require(:item_purchase).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :purchase_id ).
  merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:item_id])
 end
end
