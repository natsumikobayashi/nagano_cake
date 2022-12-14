class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  belongs_to :cart_item
end
