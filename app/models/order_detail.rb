class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { cannot: 0, waiting: 1, makingnow: 2, finish:3 }
  
  def subtotal
    item.add_tax_price * quantity
  end
  
end
