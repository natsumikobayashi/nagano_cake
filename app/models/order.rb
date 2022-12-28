class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, shipping: 4 }
  
  def order_detail_count#order_detailの注文個数をcount
    total = 0
    order_details.each do |order_detail|
      total += order_detail.quantity
    end
    return total
  end

end
