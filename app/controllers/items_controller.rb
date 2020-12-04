class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :cost_id, :days_id, :category_id, :prefacture_id, :image).merge(user_id: current_user.id)
  end

end
