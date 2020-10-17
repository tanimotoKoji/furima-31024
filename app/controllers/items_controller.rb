class ItemsController < ApplicationController
  
  def index
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


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :price,
       :postage_id, :prefectures_id, :handing_item_id, :image).merge(user_id:current_user.id)

  end

  def create
  end

end
