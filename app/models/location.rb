# == Schema Information
#
# Table name: locations
#
#  city           :string(255)
#  created_at     :datetime
#  id             :integer          not null, primary key
#  location_hash  :string(255)
#  name           :string(255)
#  state          :string(255)
#  street_address :string(255)
#  updated_at     :datetime
#

require 'digest/md5'

class Location < ActiveRecord::Base
	def self.compute_hash(street_address, city)
		Digest::MD5.hexdigest(street_address.strip.downcase + city.strip.downcase)
	end

	def self.find_by_location_hash(street_address, city)
		Location.where(:location_hash => Location.compute_hash(street_address, city)).first
	end

	before_create :set_prereqs

	def set_prereqs
		self.name = "#{self.street_address}, #{self.city}, #{self.state}" if (!self.name || self.name.empty)
		self.location_hash = Location.compute_hash(self.street_address, self.city)
	end
end
