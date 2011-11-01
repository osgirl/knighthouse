class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :item_types, :name, :unique => true
  end
end
