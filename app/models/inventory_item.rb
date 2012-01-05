class InventoryItem < ActiveRecord::Base
	belongs_to :item_type
	belongs_to :location
end
