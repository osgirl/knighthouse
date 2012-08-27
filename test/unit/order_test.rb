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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
