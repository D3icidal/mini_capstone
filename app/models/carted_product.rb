class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true #cuz a shopping cart item has no order_id association until it has been purchased
end
