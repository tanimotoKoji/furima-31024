class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
    
    if @item.purchase.present?
      redirect_to root_path
    end
  end
  
  def create
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:price, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id:current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end


