class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user
  protect_from_forgery with: :null_session
  #SHOPPING CART
  def create
    if current_user   #Authentication
      puts "current user: #{current_user.name}"
    else
      puts "\t BAD USER #{current_user}"
    end
    # @product_id = Product.find_by(id: params[product_id])
    @product_id = params[:product_id]
    @quantity = params[:quantity]
    @status = "carted"
    @user_id = current_user.id
    puts "USERID: #{@user_id}\t" * 6      #debuging
    current_cart = CartedProduct.new(
      product_id: @product_id,
      quantity: @quantity,
      status: @status,
      user_id: @user_id 
      )
    if current_cart.save!
      render json: current_cart #todo add json page
    else
      render json: "failed to save cart"
    end
  end

  def index
    if current_user   #Authentication
      puts "\n\tCurrent user: #{current_user.name}\n"
    else
      puts "\t BAD USER #{current_user}"
    end
    # testuser = User.second
    # puts "\n\tuser is #{testuser.name}\n\n\n"
    render json: current_user.carted_products #TODO add json page
  end

end
