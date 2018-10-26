class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def subtotal
    subtotal = product.price * quantity
    puts "\t\torder.rb subtotal is #{subtotal}"
    return subtotal
  end
end
