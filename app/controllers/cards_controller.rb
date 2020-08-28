class CardsController < ApplicationController
  require 'payjp'
  
  def new
  end

  def create
    Payjp.api_key = "sk_test_2b6a107dea98c4ea8c9b5a84"
    customer = Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )

    @card = Card.new(
      customer_id: customer.id,
      card_id: customer.default_card,
      user_id: current_user.id
    )
    @card.save
  end



end
