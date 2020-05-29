class OrdersController < ApplicationController
  def index
  end


  def create
    @order = Order.create(price_params)
    pay_item
    redirect_to root_path
  end


  private

  def price_params
    params.permit(:price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price_params[:price],
      card: params[:token],
      currency:'jpy'
    )
  end
end
