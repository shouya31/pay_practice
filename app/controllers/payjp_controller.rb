class PayjpController < ApplicationController

  def index
  end


  def create
    @price = Price.create(price_params)
    pay_item
  end


  private

  def price_params
    params.permit(:price)
  end

  def pay_item
    Payjp.api_key = 'sk_test_a309a0a09c01fc5695e76319'
    charge = Payjp::Charge.create(
      amount: price_params[:price],
      card: params[:token],
      currency:'jpy'
    )
  end

end
