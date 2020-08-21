class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new 
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id,:brand_name, :item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:user_id, images_attributes: [:url])
  end
end
