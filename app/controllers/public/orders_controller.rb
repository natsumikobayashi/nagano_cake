class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def confirm
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
　    @order.address = @address.address
      @order.name = @address.name
      @order.save!
      redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  private

   def order_params
       params.require(:order).permit(:payment_method, :postcode, :address, :name)
   end


 end
