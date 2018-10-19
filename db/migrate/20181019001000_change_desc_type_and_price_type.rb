class ChangeDescTypeAndPriceType < ActiveRecord::Migration[5.2]
  def change
#     Your description attribute may currently use the wrong data-type (string). Update it with the correct one if needed.

# • Update the price attribute with the correct data-type. Be mindful of the correct number digits your type of products require.

# • Bonus: Add an attribute you can use to describe if the product is in-stock or out-of-stock.
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 9, scale: 2                 
    add_column :products, :stock, :boolean
  end
end
