# == Schema Information
#
# Table name: item_types
#
#  created_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime
#

class ItemType < ActiveRecord::Base
	before_validation :fix_title

	def fix_title
		self.name = self.name.strip.downcase
	end
end
