class Api::ProductsController < ApplicationController
  def show_all
    @products = Product.all
    render "show_all.json.jbuilder"
  end
end
