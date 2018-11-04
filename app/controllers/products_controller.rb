class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: "hello world"
    render "index.html.erb"
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


end
