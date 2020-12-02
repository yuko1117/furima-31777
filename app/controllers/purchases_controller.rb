class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_purchase, only: [:index]

  def index
    @item_purchase = ItemPurchase.new
    if @item.purchase
       redirect_to root_path
    end
  end

  def create

    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
       pay_item
       @item_purchase.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :purchase_id ).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_purchase
    @item = Item.find(params[:item_id])
    if current_user == @item.user 
       redirect_to root_path
    end
  end
  
   def pay_item
     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
     Payjp::Charge.create(
       amount: @item.selling_price, 
       card: purchase_params[:token],   
       currency: 'jpy'
     )
    end        
end
