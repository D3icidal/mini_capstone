class ProductsController < ApplicationController
  #/products    HTML
  def index
    @products = Product.all
    # render json: "hello world"
    # render "index.html.erb"
  end

  def new #input form
    # render json: "hellow world - new"
    render "new.html.erb"
  end

  def show
    # render json: "hello world -show"
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    p "NEW PRODUCT MADE WITH CREATE!!!!"
    p @product
    @product.save!
    redirect_to "/products"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    # if Product.find_by(id: params[:id])
    #   render edit.html.erb
    # else
    #   render json: "Could not find product ID: #{params[:id]}"
    # end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.description = params[:description] || @product.price
    @product.price = params[:price] || @product.price
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    @product.save
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end

end
