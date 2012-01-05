class OrdersController < ApplicationController
	layout 'main'
  before_filter :authenticate_user!
  
  def index
  	@orders = Order.order("created_at DESC").page(params[:page])
  end

  def show
  	@order = Order.find params[:id]
  end

  def new
  	@order = Order.new
  end

  def edit
  	@order = Order.find params[:id]
  end

end
