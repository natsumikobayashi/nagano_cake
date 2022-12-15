class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_item_path(@item.id) #数字として送る
  end

  def show
    @item = Item.find(params[:id]) #パラメータからidを探して(params)、そのid(主キー)を持つitemを1件取得する
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
     params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active, :id)
  end
end
