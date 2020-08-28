class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new]

  def index
    @items = Item.includes(:images).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
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

  def buy_check_page
    @item = Item.find(params[:id])
  end

  def pay
    @item = Item.find(params[:id])
    @card = Card.

    Payjp.api_key = "sk_test_2b6a107dea98c4ea8c9b5a84"
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'], 
      currency: 'jpy'
    )
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:name,:description,:brand_name,:item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:image_id,images_attributes:[:id,:image,:item_id]).merge(user_id: current_user.id)
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