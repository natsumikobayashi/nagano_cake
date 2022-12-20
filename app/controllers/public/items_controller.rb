class Public::ItemsController < ApplicationController
  def index
    @item_count = Item.count
    @items = Item.page(params[:page])
  end

  def show
  end
end
