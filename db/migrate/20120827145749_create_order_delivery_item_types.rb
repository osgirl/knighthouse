class CreateOrderDeliveryItemTypes < ActiveRecord::Migration
  def change
    create_table :order_delivery_item_types do |t|
      t.integer :item_type_id
      t.integer :order_id
      t.integer :quantity
      t.text :notes

      t.timestamps
    end
  end
end
