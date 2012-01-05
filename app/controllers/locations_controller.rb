class LocationsController < ApplicationController
  layout 'main'
  before_filter :authenticate_user!
  
  def index
  	@locations = Location.order("street_address ASC").page(params[:page])
  end

  def show
  	@location = Location.find params[:id]
  end

  def new
  	@location = Location.new
  end

  def edit
  	@location = Location.find params[:id]
  end

end
