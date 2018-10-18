class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price])
    @product.save
    render "show.json.jbuilder"
  end

  def show
    @product = Product.find_by(id: params[:id])
    p @product
    render "show.json.jbuilder"
  end

  def update  
    @product_id = params[:id]   
    if validate_id(@product_id)      
      @product = Product.find_by(id: @product_id)
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description || "none"
    )
    render "show.json.jbuilder"
    else
      render "bad_id.json.jbuilder"
    end
    
  end

  def validate_id(id)
    if Product.find_by(id: id) != nil
      p "true!!!!!!!!"
      return true
    else
      p "false!!!!!!!!"
      return false
    end
  end

  def bad_id(bad_id)

  end
end


