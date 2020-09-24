class CardsController < ApplicationController
  require 'payjp'
  before_action :set_api_key, only:[:index,:create,:destroy,:add_card,:change_default_card]
  before_action :set_card_table_id, only:[:index,:new,:add_card,:change_default_card]
  

  def index
    @back_url = URI(request.referer).path
    if params[:url].present?
      @back_url = params[:url]
    end
    if @card.present?
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @cards = @customer.cards.all
      @cards_id = Card.where(user_id: current_user.id).order("created_at DESC")
    end
  end

  def new
    @back_url = params[:back_url]
  end

  def create
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    @card = Card.new(
      customer_id: customer.id,
      card_id: customer.default_card,
      user_id: current_user.id
    )
    if @card.save
      redirect_to cards_path(url: params[:url]), notice: 'カード情報を登録しました'
    else
      render :new
    end
  end

  def destroy
    @card = Card.find(params[:id])
    customer = Payjp::Customer.retrieve(@card.customer_id)
    card = customer.cards.retrieve(@card.card_id)
    card.delete
    
    if @card.delete
      redirect_to cards_path, notice: 'カード情報を削除しました'
    else
      render :destroy
    end
  end

  def add_card
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @customer= customer.cards.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id},
      default: true
    )
    @card_data = Card.new(
      customer_id: @card.customer_id,
      card_id: @customer.id,
      user_id: current_user.id
    )
    if @card_data.save
      redirect_to cards_path(url: params[:url]), notice: 'カード情報を追加しました'
    else
      render :new
    end
  end

  def change_default_card
    card_id = Card.find(params[:cards_table_id]) 
    customer = Payjp::Customer.retrieve(@card.customer_id) 
    customer.default_card = card_id.card_id
    respond_to do |format|
      if customer.save
        if URI(request.referer).path == "/cards"
          format.html {redirect_to cards_path , notice: 'カードの変更が完了しました'}
        else
          format.html {redirect_to items_item_path(URI(request.referer).path.gsub(/[^\d]/, "").to_i),  notice: 'カードの変更が完了しました'}
        end
      else
        render :index
      end
    end
  end

  private

  def set_api_key
    Payjp.api_key = ENV['SECRET_KEY']
  end

  def set_card_table_id
    @card = Card.find_by(user_id: current_user.id)
  end

end
