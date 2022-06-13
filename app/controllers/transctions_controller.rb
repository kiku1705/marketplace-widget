class TransctionsController < ApplicationController
  # before_action :set_transction, only: [:show, :update, :destroy]
  before_action :set_buyer_seller, only: :create
  include Payment
  
  # POST /transctions
  def create
    # check if not found any entity
    price = Widget.find(params[:widget_id])&.price.to_f
    if widget_payment(@seller,@buyer, price)
      render json: {message: 'Widget sold successfully'}
    else
      render json: { message: 'Buyer doesn\'t have sufficient balance to buy'}, status: :unprocessable_entity
    end
  end

  private
  def set_buyer_seller
    @buyer = User.find(params[:buyer_id])
    @seller = User.find(params[:seller_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transction
    @transction = Transction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transction_params
    params.fetch(:transction, {})
  end
end
