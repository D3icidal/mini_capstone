class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories #many to many with a join table
end

#TODO check syntax among category.rb, products.rb, etc associations relating to join table product_category