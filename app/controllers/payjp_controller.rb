class PayjpController < ApplicationController

  def index
  end


  def create
    pay_item
  end


  private

  def pay_item
    Payjp.api_key = 'sk_test_a309a0a09c01fc5695e76319'
    charge = Payjp::Charge.create(
      amount: 5555,
      card: params[:token],
      currency:'jpy'
    )
  end

end
