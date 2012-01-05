class CreateDeliveryPointTypes < ActiveRecord::Migration
  def change
    create_table :delivery_point_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
