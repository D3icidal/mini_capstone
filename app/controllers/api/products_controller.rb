class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  # before_action :authenticate_admin, except: [:index, :show]

  def index
    if current_user
      puts "\n\n\tCURRENT USER #{current_user.name} ********\n\n"
    else
      puts "\n\n\tapi-index failed current_user is probably nil (not signed in) *********\n\n"
    end
    @search_term = params[:search_term]
    # p @search_term
    # @products = Product.all
    @products = Product.where('name LIKE ?', "%#{@search_term}%") 
    @sort_by = "id => asc"
    if params[:sort_by] == 'price'
      # sort by price
      @products = @products.order(:price => :asc)
    else
      # sort by id
      @products = @products.order(:id => :asc)
    end
    # render "index.json.jbuilder"
    render json: @products
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
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
      description: params[:description] || @product.description || "none",
      supplier_id: params[:supplier_id] || @product.supplier_id || "none"
    )
      if @product.save
        render "show.json.jbuilder"
      else
        p "bad update"
        render "error.json.jbuilder"
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


