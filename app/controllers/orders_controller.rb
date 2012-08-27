class OrdersController < ApplicationController
	layout 'sidebar'
  before_filter :authenticate_user!
  
  def index
  	@orders = Order.order("created_at DESC").page(params[:page])
  end

  def show
  	@order = Order.find params[:id]
  end

  def new
  	@order = Order.new
    @order.client = Client.new
  end

  def edit
  	@order = Order.find params[:id]
  end

end
