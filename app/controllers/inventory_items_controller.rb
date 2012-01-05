class InventoryItemsController < ApplicationController
  layout 'main'
  before_filter :authenticate_user!
  
  def index
  	@inventory_items = InventoryItem.order("created_at DESC").page(params[:page])
  end

  def show
  	@inventory_item = InventoryItem.find params[:id]
  end

  def new
  	@inventory_item = InventoryItem.new
  end

  def edit
  	@inventory_item = InventoryItem.find params[:id]
  end

end
