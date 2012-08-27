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

require 'test_helper'

class OrderItemLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
