class ItemType < ActiveRecord::Base
	before_validation :fix_title

	def fix_title
		self.name = self.name.strip.downcase
	end
end
