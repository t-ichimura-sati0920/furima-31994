class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :bulding_name, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

end