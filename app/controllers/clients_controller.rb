class ClientsController < ApplicationController
	layout 'main'
  before_filter :authenticate_user!

  def index
  	@clients = Client.order("last_name ASC").page(params[:page])
  end

  def show
  	@client = Client.find params[:id]
    @orders = @client.orders.page(params[:page])
    @items = @client.inventory_items
  end

  def new
  	@client = Client.new
  end

  def edit
  	@client = Client.find params[:id]
  end

end
