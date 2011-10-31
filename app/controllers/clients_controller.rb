class ClientsController < ApplicationController
	layout 'main'

  def index
  	@clients = Client.order("last_name ASC").page(params[:page])
  end

  def show
  	@client = Client.find params[:id]
  end

  def new
  	@client = Client.new
  end

  def edit
  	@client = Client.find params[:id]
  end

end
