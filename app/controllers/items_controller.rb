class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order("created_at DESC")
    # @item_image = @item.images
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
  end


  private
  def item_params
    params.require(:item).permit(:name,:description,:brand_name,:item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:image_id,images_attributes:[:id,:image,:item_id])

  end
end

# if @item.save
#   params[:images]['image'].each do |a|
#     @item_image = @item.images.create!(image: a)
#   end
#   redirect_to root_path, notice: '出品しました。'
# else
#   render :new
# end