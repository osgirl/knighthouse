class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :old_item_id
      t.integer :item_type_id
      t.integer :current_location_id
      t.integer :inventory_count, :default => 1
      t.decimal :cost_per_day, :default => 0
      t.decimal :max_cost, :default => 0
      t.decimal :actual_cost, :default => 0
      t.datetime :age_start_date
      t.datetime :date_received
      t.boolean :is_retired, :default => false

      t.timestamps
    end

    add_index :inventory_items, :old_item_id, :unique => true
  end
end
