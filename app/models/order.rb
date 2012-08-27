# == Schema Information
#
# Table name: orders
#
#  alternate_phone         :string(255)
#  client_id               :integer
#  created_at              :datetime
#  delivery_point_type_id  :integer
#  delivery_type           :integer
#  directions              :text
#  id                      :integer          not null, primary key
#  location_id             :integer
#  miles                   :float
#  scheduled_delivery_date :datetime
#  status                  :integer
#  time                    :integer
#  updated_at              :datetime
#

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
	belongs_to :contact, :class_name => "Client"
	belongs_to :location
	belongs_to :delivery_point_type
	has_many   :order_item_lines

	before_validation :set_prereqs
	accepts_nested_attributes_for :order_item_lines

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

	def item_list
		"items here"
	end
end
