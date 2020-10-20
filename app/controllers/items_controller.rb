class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
   unless user_signed_in? && current_user.id == @item.user_id
    redirect_to action: :index
   end
   
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to action: :show
    else  
      render :edit
    end
  end  


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :price,
       :postage_id, :prefecture_id, :handing_item_id, :image).merge(user_id:current_user.id)

  end

end
