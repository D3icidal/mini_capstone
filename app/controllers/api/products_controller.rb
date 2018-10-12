class Api::ProductsController < ApplicationController
  def show_all
    @products = Product.all
    render "show_all.json.jbuilder"
  end

  def iphone
    @iPhone = Product.find_by(name: "iPhone")
    p @iPhone
    render "show_iPhone_View.json.jbuilder"
  end
end


