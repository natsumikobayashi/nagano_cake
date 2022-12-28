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
      @order.postcode = @address.postal_code
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
     @cart_items = current_customer.cart_items
     @cart_items.each do |cart_item|
       @order_detail = OrderDetail.new #(order_detail_params)
       @order_detail.order_id = @order.id
       @order_detail.item_id = cart_item.item.id
       @order_detail.quantity = cart_item.amount
       @order_detail.price = cart_item.item.add_tax_price
       @order_detail.save!
       cart_item.destroy #saveしたらcartitemを空にする
     end
     redirect_to orders_complete_path
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