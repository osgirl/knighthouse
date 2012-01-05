class CreateOrderItemLines < ActiveRecord::Migration
  def change
    create_table :order_item_lines do |t|
      t.integer :order_id
      t.integer :item_type_id
      t.integer :inventory_item_id
      t.text :notes

      t.timestamps
    end
  end
end
