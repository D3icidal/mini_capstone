class Product < ApplicationRecord

  # What should validations should product have?

  # name
  #  presence
  #  uniqueness
  validates :name, :price, :description, presence: true 


  # price
  #  presence
  #  numericality
  #  less than whatever you picked for your decimal
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  


  # description
  #  at least 10 characters
    #{}`is_discounted?` that returns true if an item is under $10 and false otherwise.


  def is_discounted?
    price < 10 ? true : false
  end

  #{}`tax` which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
  def tax
    price * 0.09
  end


  #{}`total` which will return the sum of the price + tax.
  def total
    price+tax
  end



end
