class PurchaseController < ApplicationController
  def index 
  end

  def create
    @purchase = Purchase.create(purachase_params)
  end

  
  private
  def purchase_params
      params.require(:purchase).permit().merge(user_id:current_user.id,item_id,item_id: params[:item_id])
  
  end
  

  end



