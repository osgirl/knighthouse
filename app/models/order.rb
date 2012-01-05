class Order < ActiveRecord::Base
	STATUSES = [ :pending, 
				 :not_complete, 
				 :not_accurate, 
				 :canceled_by_client, 
				 :canceled, 
				 :non_deliverable, 
				 :out_for_delivery, 
				 :delivered 
			   ]
	DELIVERY_TYPES = [ :delivery, :pickup, :both ]

	belongs_to :client
	belongs_to :location
	belongs_to :delivery_point_type
	has_many   :order_item_lines

	before_validation :set_prereqs

	def set_prereqs
		self.delivery_type = DELIVERY_TYPES.first unless self.delivery_type
		self.status = STATUSES.index(:delivered) unless self.status
	end

	def add_line(type, item = nil)
		order_item_lines.create!(:item_type => type, :inventory_item => item)
	end

	def friendly_status
		return STATUSES[status].to_s.titleize
	end
end
