class Api::ImagesController < ApplicationController
  def index
    @search_term = params[:search_term]
    @images = Image.where('name LIKE ?', "%#{@search_term}%") 
    @sort_by = "id => asc"
    if params[:sort_by] == 'name'
      # sort by price
      @images = @images.order(:name => :asc)
    else
      # sort by id
      @images = @images.order(:id => :asc)
    end
    render "index.json.jbuilder" #NEW jsons
  end

  def create
    @image = Image.new(
      name: params[:name],
      url: params[:url],
      product_id: params[:product_id] #belongs to
      )
    if @image.save
      render "show.json.jbuilder"   #TODO new jsons
    else
      p "create failed - booo"
    end
  end
end
