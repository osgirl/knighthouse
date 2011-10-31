class Client < ActiveRecord::Base
	def name
		n = "#{first_name} #{last_name}".strip
		return "[ No Name ]" if n.empty?
		return n
	end
end
