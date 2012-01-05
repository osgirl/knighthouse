require 'digest/md5'

class Location < ActiveRecord::Base
	def self.compute_hash(street_address, city)
		Digest::MD5.hexdigest(street_address.strip.downcase + city.strip.downcase)
	end

	def self.find_by_hash(street_address, city)
		Location.where(:hash => Location.compute_hash(street_address, city)).first
	end

	before_create :set_prereqs

	def set_prereqs
		self.name = "#{self.street_address}, #{self.city}, #{self.state}" if (!self.name || self.name.empty)
		self.hash = Location.compute_hash(self.street_address, self.city)
	end
end
