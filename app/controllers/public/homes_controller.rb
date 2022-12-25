class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(3)
  end

  def about
  end
end
