# == Schema Information
#
# Table name: inventory_items
#
#  actual_cost         :decimal(, )      default(0.0)
#  age_start_date      :datetime
#  cost_per_day        :decimal(, )      default(0.0)
#  created_at          :datetime
#  current_location_id :integer
#  date_received       :datetime
#  id                  :integer          not null, primary key
#  inventory_count     :integer          default(1)
#  is_retired          :boolean          default(FALSE)
#  item_type_id        :integer
#  max_cost            :decimal(, )      default(0.0)
#  old_item_id         :integer
#  updated_at          :datetime
#

class InventoryItem < ActiveRecord::Base
	belongs_to :item_type
	belongs_to :location
end
