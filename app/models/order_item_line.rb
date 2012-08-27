# == Schema Information
#
# Table name: order_item_lines
#
#  created_at        :datetime
#  id                :integer          not null, primary key
#  inventory_item_id :integer
#  item_type_id      :integer
#  notes             :text
#  order_id          :integer
#  updated_at        :datetime
#

class OrderItemLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :inventory_item
	belongs_to :item_type

	attr_accessor :item_type_name, :qty
end
