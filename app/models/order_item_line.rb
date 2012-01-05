class OrderItemLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :inventory_item
	belongs_to :item_type
end
