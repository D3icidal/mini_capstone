class Product < ApplicationRecord

  validates :name, :price, :description, presence: true 
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true
  
  belongs_to :supplier
  has_many :images

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

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
