class Api::OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    p current_user.name * 5
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    subtotal = 1.11
    subtotal = product.price * quantity
    tax = 1.11
    tax = product.tax * quantity
    total = product.total * quantity
    # puts "\t\t\t subtotal is #{subtotal}\t***************"
    @order = Order.new(
      product_id: product.id,
      quantity: quantity,
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if @order.save
      # render json: "order created" * 5
      puts "\t\torder created #{@order}"
      render "show.json.jbuilder"
    else
      render json: "failed"
      p "create failed - booo" * 5
    end
  end

  def index
      puts " \t****** Current user logged in: #{current_user.name}"
      p 'current_user'
      p current_user.name
      p current_user #shows who is logged in (to verify authorization token)
      if current_user
        @orders = current_user.orders
        render "index.json.jbuilder"
      else
        render json: "go away"
      end
  end

  def show
    @order = Order.find_by(id: params[:id])
    p @order
    if @order.user_id == current_user.id
      render "show.json.jbuilder"
    else
      render json: "boooo"
    end
  end


end

