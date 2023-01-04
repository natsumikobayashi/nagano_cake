class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  def update
  end
end
