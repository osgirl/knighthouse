# == Schema Information
#
# Table name: clients
#
#  created_at :datetime
#  first_name :string(255)
#  id         :integer          not null, primary key
#  last_name  :string(255)
#  old_id     :integer
#  phone      :string(255)
#  updated_at :datetime
#

class Client < ActiveRecord::Base
	has_many :orders
	has_many :order_item_lines, :through => :orders
	has_many :inventory_items, :through => :order_item_lines
	has_many :locations, :through => :orders
	def name
		n = "#{first_name} #{last_name}".strip
		return "[ No Name ]" if n.empty?
		return n
	end

	def self.find_fuzzy

	end
end
