class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :location_hash

      t.timestamps
    end

    add_index :locations, :location_hash, :unique => true
  end
end
