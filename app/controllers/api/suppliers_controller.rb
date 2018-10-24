class Api::SuppliersController < ApplicationController   
  def index
    @suppliers = Supplier.all
    render "index.json.jbuilder"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    p @supplier
    render "show.json.jbuilder"
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    if @supplier.save
      render "show.json.jbuilder"
    else
      p "create failed - booo"
    end
  end
 

  def update  
    @supplier_id = params[:id]          
    @supplier = Supplier.find_by(id: @supplier_id)
    @supplier.update(
    name: params[:name] || @supplier.name,
    price: params[:price] || @supplier.price,
    mail: params[:email],
    phone_number: params[:phone_number]
  )
    if @supplier.save
      render "show.json.jbuilder"
    else
      p "bad update"
      render "error.json.jbuilder"
    end  
  end

end
