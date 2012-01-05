class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :location_id
      t.integer :client_id
      t.string :alternate_phone
      t.text :directions
      t.integer :delivery_point_type_id
      t.integer :delivery_type
      t.float :miles
      t.integer :time
      t.datetime :scheduled_delivery_date
      t.integer :status

      t.timestamps
    end
  end
end
