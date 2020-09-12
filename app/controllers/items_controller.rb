class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user! , only: [:new]
  before_action :set_api_key, only:[:buy_check_page, :pay]
  before_action :set_card_table_id, only:[:buy_check_page, :pay]


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
    # , nil, unique: [:session_hash]
    @page_views = @item.impressionist_count
  end

  def index_more_new_page
    @items = Item.includes(:images).order("created_at DESC").page(params[:page]).per(12)
  end

  def buy_check_page
    @item = Item.find(params[:id])
    @customer = Payjp::Customer.retrieve(@card.customer_id) 
    @default_card = @customer.cards.retrieve(@customer.default_card)
    
  end

  def pay
    @item = Item.find(params[:id])
    @customer = Payjp::Customer.retrieve(@card.customer_id)

    Payjp::Charge.create(
      amount: @item.price,
      customer: @customer, 
      currency: 'jpy'
    )
    
    @item.update( buy_status: 1 ,buyer_id: current_user.id )
    redirect_to done_page_items_path
  end

  def done_page
  end


  private
  def item_params
    params.require(:item).permit(:name,:description,:brand_name,:item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:buy_status,:image_id,images_attributes:[:id,:image,:item_id]).merge(user_id: current_user.id)
  end

  def set_api_key
    Payjp.api_key = ENV['SECRET_KEY']
  end

  def set_card_table_id
    @card = Card.find_by(user_id: current_user.id)
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