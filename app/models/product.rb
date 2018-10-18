class Product < ApplicationRecord

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
