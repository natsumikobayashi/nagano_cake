class Public::CartItemsController < ApplicationController

 def index
   @cart_items = CartItem.all
   @total = 0
 end

 def create
    @cart_item = CartItem.new(cart_item_params) #空箱を用意して、その中にパラメータから送られてきた値(cart_item_params)を入れる
    @cart_item.customer_id = current_customer.id #保存するときに足りないcustomer_idを指定する
    @cart_item.save
     redirect_to cart_items_path
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


private
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end

end
