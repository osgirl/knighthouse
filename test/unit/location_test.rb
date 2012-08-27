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

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
