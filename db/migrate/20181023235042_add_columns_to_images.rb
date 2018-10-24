class AddColumnsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :url, :string
    add_column :images, :name, :string
    add_column :images, :product_id, :integer
  end
end
