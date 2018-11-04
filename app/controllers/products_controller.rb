class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: "hello world"
    render "index.html.erb"
  end
end
