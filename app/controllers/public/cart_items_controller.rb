class Public::CartItemsController < ApplicationController
 before_action :is_mathing_login_customer, only: [:create]

 def index
   @cart_items = current_customer.cart_items
   @total = 0
 end

 def create
    if current_customer.cart_items.exists?(item_id: params[:cart_item][:item_id])
        @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        @cart_item.amount += params[:cart_item][:amount].to_i
        @cart_item.save
        redirect_to cart_items_path
    else
        @cart_item = CartItem.new(cart_item_params) #空箱を用意して、その中にパラメータから送られてきた値(cart_item_params)を入れる
        @cart_item.customer_id = current_customer.id #保存するときに足りないcustomer_idを指定する
        if @cart_item.save == true
           redirect_to cart_items_path
        else
           @item = Item.find(params[:cart_item][:item_id])
           render "public/items/show"
        end
    end
 end

 def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(cart_item_params)
  redirect_to cart_items_path
 end


 def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
 end

 def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end


 private
 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end

 def is_mathing_login_customer
  unless customer_signed_in?
   redirect_to new_customer_session_path
  end
 end

end