class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
      )
    if @product.save
      render "show.json.jbuilder"
    else
      p "create failed - booo"
    end
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
      if @product.save
        render "show.json.jbuilder"
      else
        p "bad update"
        # render "bad_id.json.jbuilder"
      end
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


