class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:address_option] == "1" #フォームから送られてくる値は文字列のため、文字列が１のときとするために""つける
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:address_option] == "2" #代入は=のみだが、等しいは==
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:address_option] == "3"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @order_detail = current_customer.cart_items
    @order.postage = 800
    @total = 0
  end

   def create
     @order = Order.new(order_params)
     @order.save
   end

  def index
  end

  def show
  end

  private

   def order_params
       params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :billing_amount, :status, :customer_id)
   end


end