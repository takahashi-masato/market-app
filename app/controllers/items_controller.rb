class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new]

  def index
    @items = Item.includes(:images).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_name_id = [parent.name, parent.id]
      @category_parent_array << @category_parent_name_id
    end

  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    impressionist(@item)
    # , nil, :unique => [:session_hash]
    @page_views = @item.impressionist_count
  end

  def index_more_new_page
    @items = Item.includes(:images).order("created_at DESC").page(params[:page]).per(12)
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id,:brand_name, :item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:user_id, images_attributes: [:image, :id, :_destroy])  end
  end

# if @item.save
#   params[:images]['image'].each do |a|
#     @item_image = @item.images.create!(image: a)
#   end
#   redirect_to root_path, notice: '出品しました。'
# else
#   render :new
# end