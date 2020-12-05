class ItemsController < ApplicationController

  def index
    #商品一覧機能 @items = Item.order("created_at DESC") 
  end
  
  def new
    @item = Item.new

    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :cost_id, :days_id, :category_id, :prefacture_id, :image).merge(user_id: current_user.id)
  end

end
