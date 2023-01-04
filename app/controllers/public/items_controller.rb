class Public::ItemsController < ApplicationController
  def index
    @item_count = Item.count
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
