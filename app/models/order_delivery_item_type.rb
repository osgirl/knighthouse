class OrderDeliveryItemType < ActiveRecord::Base
  attr_accessible :item_type_id, :notes, :order_id, :quantity
end
